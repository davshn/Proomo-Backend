class Api::V1::NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    all_notifications = Notification.all
    render json: {data: all_notifications}, status: 200
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        notification = Notification.new
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        notification = Notification.new(notification_params)
        if notification.save
          render json: { message: 'La notificación ha sido creada con éxito'}, status: 201
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

  def notification_params
    params.require(:data).permit(
      attributes: Notification.get_params
    )
  end
end
