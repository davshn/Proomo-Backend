class Api::V1::ProductsController < ApplicationController
  kip_before_action :verify_authenticity_token

  def index
    all_products = Product.all
    render json: { data: all_products }, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        product = Product.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        product = Product.new(product_params)
        if product.save
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

  def product_params
    params.require(:data).permit(
      attributes: Product.get_params
    )
  end
end
