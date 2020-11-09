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

  def search
    begin
      query = params[:q]
      page = params[:page] || 1
      commerce = params[:commerce]
      page = 1 if page.to_i <= 0

      results = []
      unless query.nil?
        if commerce.nil?
          results = Offer.search_published(query, page)
        else
          results = Offer.search_published_by_brand(query, commerce, page)
        end
        ids = results.map{|r|  r._source.id}
      end
      offers = Offer.where(id: ids)
      render_json(
        jsonapi: offers,
        meta: {
          results: results.size
        },
        status: 200
      )
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
