class Api::V1::CommercesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_commerces = Commerce.all
    render json: {data: all_commerces}, status: 200
  end

  def new
    commerce = Commerce.new
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        commerce = Commerce.new(commerce_params)
        commerce.category_ids = params[:data][:category_ids]
        if commerce.save!
          user = User.create(email: params[:data][:user][:email], password: params[:data][:user][:password], password_confirmation: params[:data][:user][:password], commerce_ref: commerce.id)
          user.add_role(:admin_brand)
          render json: { message: 'El comercio ha sido creado con éxito'}, status: 201
        else
          raise
          # render json: {message: 'Ocurrió un error'}, status: 400
        end
      end
    rescue
      raise
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        commerce = Commerce.find(params[:id])
        commerce.update(commerce_params)
        commerce.update(category_ids: params[:data][:category_ids])
        if !params[:data][:user].nil?
          user = User.find_by(commerce_ref: commerce.id)
          if user.nil?
            User.create(email: params[:data][:user][:email], password: params[:data][:user][:password], password_confirmation: params[:data][:user][:password], commerce_ref: commerce.id)
          else
            user.update(email: params[:data][:user][:email], password: params[:data][:user][:password], password_confirmation: params[:data][:user][:password])
          end
        end
        render_json(
            jsonapi: commerce,
            status: 200
        )
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

  def show
    begin
      ActiveRecord::Base.transaction do
        commerce = Commerce.find(params[:id])
        # render json: {data: commerce}, status: 200
        category_cupons = commerce.offers.map{|x| [x.id, x.categories.map{|y| [y.name, y.id]}]}
        render_json(
            jsonapi: commerce,
            meta: category_cupons,
            status: 200
        )
      end
    rescue
      raise
    end
  end

  def find_coupons
    begin
      ActiveRecord::Base.transaction do
        commerce = Commerce.find(params[:id])
        coupons = commerce.offers.all
        # render json: {data: commerce}, status: 200
        render_json(
            jsonapi: commerce,
            meta: coupons,
            status: 200
        )
      end
    rescue
      raise
    end
  end

  def find_commerce_by_category
    begin
      ActiveRecord::Base.transaction do
        # commerces = Category.find(params[:id]).commerces
        commerces = Category.find(params[:id]).offers.map{|x| x.commerce}.uniq
        if params[:city]
          commerces = commerces.select{|x| x.city == params[:city]}
        end
        # render json: {data: commerce}, status: 200
        render_json(
            jsonapi: commerces,
            status: 200
        )
      end
    rescue
      raise
    end
  end

  def generate_reports
    begin
      start_date = Date.parse(params[:date_selected] + "-01")
      end_date = start_date.end_of_month
      search_date = start_date.beginning_of_day..end_date.end_of_day
      date_active = search_date
      reports = []
      commerces = Commerce.all
      commerces.each do |commerce|
        reports << Purchace.where(commerce_id: commerce.id, updated_at: date_active).map{|x| [commerce.name, commerce.city, commerce.partner.documment, commerce.partner.name, (x.client.first_name + ' ' + x.client.last_name), x.client.email, x.client.phone, x.ticket_id, x.state, x.total, x.created_at, commerce.nit ? commerce.nit : '']}
      end
      @reports = reports.reject(&:empty?)
      render_json(
        json:{
          data:{
            attributes:{
              reports: @reports
            }
          }
        }, status: 200
      )
    rescue
      raise
    end
  end


  private

  def commerce_params
    params.require(:data).permit(
      attributes: Commerce.get_params
    )
  end

end
