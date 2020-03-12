class Advertisement < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :image
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
