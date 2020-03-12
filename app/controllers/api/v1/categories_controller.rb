class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_categories = Category.all
    render json: {data: all_categories}, status: 200
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
        # binding.pry
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

  def category_params
    params.require(:data).permit(
      attributes: Category.get_params
    )
  end

end
