class Api::V1::CommercesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_commerces = Commerce.all
    render json: { status: 'SUCCESS', message: 'El cupón ha sido creado con éxito', data: all_commerces}
  end

  def new
    commerce = Commerce.new
  end

  def create
    commerce = Commerce.new(commerce_params)
    if commerce.save
      render json: { status: 'SUCCESS', message: 'El comercio ha sido creado con éxito'}
    else
      render json: { status: 'ERROR', message: 'Ocurrió un error'}
    end
  end

  def update
  end

  def edit
  end

  private

  def commerce_params
    params.require(:data).permit(
      attributes: Commerce.get_params
    )
  end

end
