class Commerce < ApplicationRecord

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image
    ]
  end


  mount_base64_uploader :image, ImageUploader
end
