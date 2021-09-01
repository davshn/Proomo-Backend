class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_categories = Category.where(principal_category_id: nil).sort_by {|x| x.name}
    render json: {data: all_categories}, status: 200
  end

  def index_subcategories
    all_subcategories = Category.where.not(principal_category_id: nil).sort_by {|x| x.name}
    render json: {data: all_subcategories}, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        category = Category.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        category = Category.new(category_params)
        if category.save
          render json: { message: 'La categoría ha sido creado con éxito'}, status: 201
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
        category = Category.find(params[:id])
        if category.update(category_params)
          render_json(
              jsonapi: category,
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
        category = Category.find(params[:id])
        # render json: {data: commerce}, status: 200
        render_json(
            jsonapi: category,
            status: 200
        )
      end
    rescue
      raise
    end
  end

  def destroy_category
    begin
      ActiveRecord::Base.transaction do
        category = Category.find(params[:id])
        Commerce.all.select{|x| x.category_ids.include? category.id}.map{|x| x.update(category_ids: (x.category_ids -= [category.id]))}
        Offer.all.select{|x| x.category_ids.include? category.id}.map{|x| x.update(category_ids: (x.category_ids -= [category.id]))}
        category.destroy!
        render json: { message: 'Categoria borrada'}, status: 200
      end
    rescue
      raise
    end
  end

  def find_product_categories
    product_categories = Category.where(principal_category_id: nil, concept_name: "Producto")
    render json: {data: product_categories}, status: 200
  end

  def find_service_categories
    service_categories = Category.where(principal_category_id: nil, concept_name: "Servicio")
    render json: {data: service_categories}, status: 200
  end

  def find_product_category_points
    filter_categories = Offer.where(by_points: true).map{|x| x.category_ids}.flatten
    product_categories = Category.where(id: filter_categories).where(principal_category_id: nil, concept_name: "Producto")
    render json: {data: product_categories}, status: 200
  end

  def find_service_category_points
    filter_categories = Offer.where(by_points: true).map{|x| x.category_ids}.flatten
    service_categories = Category.where(id: filter_categories).where(principal_category_id: nil, concept_name: "Servicio")
    render json: {data: service_categories}, status: 200
  end

  private

  def category_params
    params.require(:data).permit(
      attributes: Category.get_params
    )
  end

end
