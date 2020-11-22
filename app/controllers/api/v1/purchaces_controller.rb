class Api::V1::PurchacesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_purchaces = Purchace.all
    render json: { data: all_purchaces }, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        purchace = Purchace.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        purchace = Purchace.new(purchace_params)
        if purchace.save
          render json: { message: 'La Compra ha sido creado con éxito'},status: 201
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

  def purchace_params
    params.require(:data).permit(
      attributes: Purchace.get_params,
      purchace_items_attributes: PurchaseItem.get_params
    )
  end
end
