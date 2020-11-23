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
      aggs_brands = results.response["aggregations"]["brands"]["buckets"] # se extraen las marcas que estan vendiendo ese producto
      brands_id = aggs_brands.map{ |b|  b["key"] } # extraemos el id del comercio
      brands = Commerce.where(id: brands_id).select(:id, :name).limit(10)
      brands_mapped = brands.map{ |brand| { id: brand.id, name: brand.name, quantity: aggs_brands.find{|e| e["key"] == brand.id}["doc_count"]  } } # se junta el id, nombre de la marca y la cantidad de productos que hacen match
      render json: { data: offers, hits: results.response.hits.total.value, sellers: brands_mapped }
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
