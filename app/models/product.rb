class Product < ApplicationRecord
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
