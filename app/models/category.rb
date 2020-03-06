class Category < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image
    ]
    mount_base64_uploader :image, ImageUploader
  end
end
