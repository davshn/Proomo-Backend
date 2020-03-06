class Api::V1::CouponsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_coupons = Coupon.all
    render json: { status: 'SUCCESS', message: 'El cupón ha sido creado con éxito', data: all_coupons}
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        commerce = Coupon.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        coupon = Coupon.new(coupon_params)
        if coupon.save
          render json: { status: 'SUCCESS', message: 'El cupón ha sido creado con éxito'}
        else
          render json: { status: 'ERROR', message: 'Ocurrió un error'}
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

  def coupon_params
    params.require(:data).permit(
      attributes: Commerce.get_params
    )
  end

end
