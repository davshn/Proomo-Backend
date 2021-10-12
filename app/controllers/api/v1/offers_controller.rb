class Api::V1::OffersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_offers = Offer.all
    render json: { data: all_offers }, status: 200
  end

  def find_coupons_by_commerce
    all_offers = Offer.where(commerce_id: params[:commerce_id])
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
        offer.category_ids = params[:data][:category_ids]
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
        offer = Offer.find(params[:id])
        offer.update(offer_params)
        offer.update(category_ids: params[:data][:category_ids])
        render_json(
            jsonapi: offer,
            status: 200
        )
      end
    rescue
      raise
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
        offer = Offer.find(params[:id])
        # render json: {data: commerce}, status: 200
        render_json(
            jsonapi: offer,
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

  def get_index
    offers = Offer.where(published: true).map{|x| [x.id, 'offer', (x.title+' '+x.description), x.title, x.description ]}
    if params[:city]
      commerces = Commerce.where(published: true, city: params[:city]).map{|x| [x.id, 'commerce', (x.name+' '+x.description), x.name, x.description ]}
    elsif
      commerces = Commerce.where(published: true).map{|x| [x.id, 'commerce', (x.name+' '+x.description), x.name, x.description ]}
    end
    render json: { index: offers + commerces },status: 200
  end

  private

  def offer_params
    params.require(:data).permit(
      attributes: Offer.get_params
    )
  end
end
