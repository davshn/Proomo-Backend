class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.get_params(exclude = [])
    params = [
      :id,
      :email,
      :first_name,
      :second_name,
      :last_name,
      :last_second_name,
      :user_name,
      :phone,
      :birthday,
      :genre,
      :password,
      :password_confirmation,
      :favorite_offers,
      :city,
      :latitude,
      :longitude,
      :notifications_id
    ]
  end
end
