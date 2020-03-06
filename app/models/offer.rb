class Offer < ApplicationRecord
  belongs_to :commerce
  has_many :coupons

  def self.get_params(exclude = [])
    params = [
      :id,
      :commerce_id,
      :title
    ]
  end
end
