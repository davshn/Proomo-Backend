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
        if commerce.save
          render json: { message: 'El comercio ha sido creado con éxito'}, status: 201
        else
          render json: {message: 'Ocurrió un error'}, status: 400
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

  def show
    begin
      ActiveRecord::Base.transaction do
        commerce = Commerce.find(params[:id])
        render json: {data: commerce}, status: 200
      end
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
