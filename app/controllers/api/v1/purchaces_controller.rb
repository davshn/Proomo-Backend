class Api::V1::PurchacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ColletModule

  def index
    all_purchaces = Purchace.all
    render json: { data: all_purchaces }, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        purchace = Purchace.new
      end
    rescue
      raise
    end
  end


  def create
    begin
      ActiveRecord::Base.transaction do
        Rails.logger.debug("create----->")
        purchace = Purchace.new(purchace_params)
        #purchace = Purchace.new(state: params['state'],client_id: params['client_id'])
        #Rails.logger.debug("state , client_id  -----> ", params['state'] , params['client_id'])
        if purchace.save
          Rails.logger.debug(" IF  -----> ")
          user = User.find_by(id: purchace.client_id)
          Rails.logger.debug(" user  -----> ")
          name = user.first_name.to_s + " " + user.second_name.to_s + " " + user.last_name.to_s + " " + user.last_second_name.to_s
          Rails.logger.debug(" name  -----> ")
          reference_array = ['CC',user.id,purchace.id,name,user.email,user.phone]
          Rails.logger.debug(" reference_array  -----> ")
          transaction = ColletModule.create_transaction_payment(purchace.id,params[:value],reference_array)
          Rails.logger.debug(" transaction  -----> ")
          purchace.total = params[:value]
          Rails.logger.debug(" purchace.total  -----> ")
          purchace.ticket_id = transaction[:data]['TicketId']
          Rails.logger.debug(" purchace.ticket_id  -----> ")
          purchace.state = 'PENDING'
          Rails.logger.debug(" purchace.state  -----> ")
          purchace.save
          Rails.logger.debug(" purchace.save  -----> ")
          url = transaction[:data]['eCollectUrl']
          Rails.logger.debug(" url  -----> #{ url } ")
          render json: { message: 'La Compra ha sido creado con éxito', url: url },status: 201
        else
          render json: { message: 'Ocurrió un error' }, status: 400
          Rails.logger.debug(" ELSE  -----> ")
        end
      end
    rescue
      raise
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
      end
    rescue
      raise
    end
  end

  def edit
    begin
      ActiveRecord::Base.transaction do
      end
    rescue
      raise
    end
  end

  def collet_hook
    begin
      ActiveRecord::Base.transaction do
        Rails.logger.debug("Collect Hook!!!!!")
        purchase = Purchace.find_by(ticket_id: params["TicketId"])
        unless purchase.nil?
          Rails.logger.debug("Purchase Nil!!!!!")
          information = ColletModule.get_transaction_information(purchase.ticket_id)
          Rails.logger.debug("Information!!!!!")
          Rails.logger.debug(information)
          purchase.update(
            trazability_code: information[:data]['TrazabilityCode'],
            return_code: information[:data]['ReturnCode'],
            trans_value: information[:data]['TransValue'],
            bank_process_date: information[:data]['BankProcessDate'],
            fi_code: information[:data]['FICode'],
            fi_name: information[:data]['FiName'],
            payment_system: information[:data]['PaymentSystem'],
            invoice: information[:data]['Invoice'],
            state: information[:data]['ReturnCode']
          )
          Rails.logger.debug("Purchase!!!!!")
          Rails.logger.debug(purchase.commerce_id)
          purchase.save!
          Rails.logger.debug("Purchase Saved!!!!!")
          coupon = Offer.find(purchase.offer_id)
          if coupon
            user = purchase.client
            commerce = Commerce.find(purchase.commerce_id)
            if commerce.contact_email
              commerce_email = commerce.contact_email
            else
              commerce_email = 'tweniadmon@gmail.com'
            end
            if coupon.is_online_product
              PaymentMailer.confirm_online_promo(coupon.title, user.phone, user.email, user.first_name, commerce_email).deliver_now
            else
              PaymentMailer.confirm_payment(coupon.title, user.phone, user.email, user.first_name, commerce_email, purchase.total).deliver_now
            end
            render_json(
                jsonapi: purchase,
                status: 200
            )
          end
        end
      end
    rescue
      raise
    end
  end

  def validate_sale
    begin
      ActiveRecord::Base.transaction do
        purchase = Purchace.find_by(ticket_id: params["TicketId"])
        user = User.find(params["user_id"])
        if !purchase.nil? && !user.nil?
          commerce = Commerce.find(user.commerce_ref)
          if commerce && (commerce.id == purchase.commerce_id)
            information = ColletModule.get_transaction_information(purchase.ticket_id)
            Rails.logger.debug(information)
            purchase.trazability_code = information[:data]['TrazabilityCode'].to_i
            purchase.return_code = information[:data]['TranState'].to_s
            purchase.state = information[:data]['ReturnCode'].to_s
            purchase.trans_value = information[:data]['TransValue'].to_i
            purchase.bank_process_date = information[:data]['BankProcessDate']
            purchase.fi_code = information[:data]['FICode'].to_i
            purchase.fi_name = information[:data]['FiName'].to_s
            purchase.payment_system = information[:data]['PaymentSystem'].to_i
            purchase.invoice = information[:data]['Invoice'].to_i
            if purchase.state == "SUCCESS" && purchase.return_code == "OK"
              purchase.validate_sale = true
            else
              purchase.validate_sale = false
              purchase.state = information[:data]['TranState'].to_s
            end
            Rails.logger.debug(purchase)
            purchase.save!
            if purchase.validate_sale
              render json: { message: 'La compra ha sido validada con éxito' },status: 201
            else
              render json: { message: "No se pudo validar la compra, el estado del pago es: #{ purchase.state }" }, status: 400
            end
          else
            render json: { message: "Esta compra no pertenece al comercio #{commerce.name}" }, status: 400
          end
        else
          render json: { message: 'No se encuentra una compra con ese numero' }, status: 400
        end
      end
    rescue
      raise
    end
  end

  def find_my_purchaces
    begin
      ActiveRecord::Base.transaction do
        purchaces = Purchace.where(client_id: params[:id]).reverse
        coupons = Offer.where(id: purchaces.map(&:offer_id).uniq)
        render json: { data: purchaces, meta: coupons }, status: 200
      end
    rescue
      raise
    end
  end

  def find_purchace_by_ticket
    begin
      ActiveRecord::Base.transaction do
        purchace = Purchace.find_by(ticket_id: params["TicketId"].to_i)
        if !purchace.nil?
          # resume = resume = {:create_at => purchase.created_at,
          #                    :ticket_id => purchase.ticket_id,
          #                    :total => purchase.total,
          #                    :first_name => purchase.client.first_name,
          #                    :last_name => purchase.client.last_name,
          #                    :email => purchase.client.email}
          client = purchace.client
          render json: { data: purchace, meta: client },status: 201
        else
          render json: { message: 'No se pudo encontrar la compra' }, status: 400
        end
      end
    rescue
      raise
    end
  end


  private

  def purchace_params
    params.require(:data).permit(
      attributes: Purchace.get_params,
      purchace_items_attributes: PurchaseItem.get_params
    )
  end

end
