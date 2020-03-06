class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_favorites = Favorite.all
    render json: {data: all_favorites}, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        favorite = Favorite.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        favorite = Favorite.new(favorite_params)
        if favorite.save
          render json: { message: 'Se ha añadido a favoritos con éxito'}, status: 201
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

  def favorite_params
    params.require(:data).permit(
      attributes: Favorite.get_params
    )
  end

end
