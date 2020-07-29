class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def find_client
    @user = User.find_by(email: params[:data][:attributes][:email])
    if @user != nil && @user.valid_password?(params[:data][:attributes][:password]) && !@user.has_role?(:client)
      render_json(
          jsonapi: @user,
          status: 200
      )
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def find_user
    @user = User.find_by(email: params[:data][:attributes][:email])
    if @user != nil && @user.valid_password?(params[:data][:attributes][:password]) && @user.has_role?(:client)
      render_json(
          jsonapi: @user,
          status: 200
      )
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      @user.add_role(:client)
      render_json(
          jsonapi: @user,
          status: 200
      )
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def update_user
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render_json(
          jsonapi: @user,
          status: 200
      )
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:data).permit(
      attributes: User.get_params)
  end
end
