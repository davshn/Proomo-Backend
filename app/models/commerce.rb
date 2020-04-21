class Commerce < ApplicationRecord
  has_many :products
  has_many :offers
  has_many :notifications
  has_and_belongs_to_many :categories

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image,
      :description,
      :category_ids
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
