class Api::V1::OffersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_offers = Offer.all
    render json: { data: all_offers }, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        offer = Offer.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        offer = Offer.new(offer_params)
        if offer.save
          render json: { message: 'La oferta ha sido creado con éxito'},status: 201
        else
          render json: { message: 'Ocurrió un error' }, status: 400
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

  private

  def offer_params
    params.require(:data).permit(
      attributes: Offer.get_params
    )
  end
end
