class Commerce < ApplicationRecord
  has_many :products
  has_many :offers

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image
    ]
  end


  mount_base64_uploader :image, ImageUploader
end
