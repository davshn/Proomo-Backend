class PartnerController < ApplicationController
  def index
    all_partners = Partner.all
    render json: {data: all_partners}, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        partner = Partner.new
      end
    rescue
      raise
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
        partner = Partner.find(params[:id])
        # render json: {data: commerce}, status: 200
        render_json(
            jsonapi: partner,
            status: 200
        )
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        partner = Partner.new(partner_params)
        if partner.save
          render json: { message: 'El referido ha sido creado con éxito'}, status: 201
        else
          render json: { message: 'Ocurrió un error'}, status: 400
        end
      end
    rescue
      raise
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        partner = Partner.find(params[:id])
        if partner.update(partner_params)
          render_json(
              jsonapi: partner,
              status: 200
          )
        else
          raise
        end
      end
    rescue
      raise
    end
  end

  private

  def partner_params
    params.require(:data).permit(
      attributes: Partner.get_params
    )
  end
end
