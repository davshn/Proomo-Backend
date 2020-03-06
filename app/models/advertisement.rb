class Advertisement < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :image
    ]
    mount_base64_uploader :image, ImageUploader
  end
end
