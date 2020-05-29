class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  has_and_belongs_to_many :offers
  has_and_belongs_to_many :commerces
  has_many :advertisements

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image
    ]
  end

  mount_base64_uploader :image, ImageUploader
end
