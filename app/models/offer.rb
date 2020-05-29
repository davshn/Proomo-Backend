class Offer < ApplicationRecord
  belongs_to :commerce
  has_many :coupons
  has_and_belongs_to_many :categories

  def self.get_params(exclude = [])
    params = [
      :id,
      :commerce_id,
      :title,
      :description,
      :image,
      :terms_and_conditions,
      :category_ids,
      :published
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
