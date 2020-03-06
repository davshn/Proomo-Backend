class Product < ApplicationRecord
  belongs_to :commerce
  has_many :product_categories
  has_many :categories, through: :product_categories

  def self.get_params(exclude = [])
    params = [
      :id,
      :commerce_id,
      :name,
      :price,
      :image
    ]
    mount_base64_uploader :image, ImageUploader
  end
end
