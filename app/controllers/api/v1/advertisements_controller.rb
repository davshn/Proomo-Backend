class Api::V1::AdvertisementsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_advertisements = Advertisement.all
    render json: { data: all_advertisements }, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        advertisement = Advertisement.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        advertisement = Advertisement.new(advertisement_params)
        if advertisement.save
          render json: { message: 'El anuncio ha sido creado con éxito'},status: 201
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

  def advertisement_params
    params.require(:data).permit(
      attributes: Advertisement.get_params
    )
  end

end
