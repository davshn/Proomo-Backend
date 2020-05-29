class Advertisement < ApplicationRecord
  belongs_to :category
  belongs_to :commerce

  def self.get_params(exclude = [])
    params = [
      :id,
      :image,
      :title,
      :text,
      :advertisement_type,
      :commerce_id
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
