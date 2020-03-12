class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image
    ]
  end

  mount_base64_uploader :image, ImageUploader
end
