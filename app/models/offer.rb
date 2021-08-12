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
      :published,
      :discount_value,
      :is_online_product,
      :price,
      :by_points,
      :redeem_points
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
