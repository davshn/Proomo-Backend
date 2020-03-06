class PurchaseItem < ApplicationRecord
  belongs_to :product
  belongs_to :purchace

  def self.get_params(exclude = [])
    params = [
      :id,
      :product_id,
      :quantity,
      :unit_price
    ]
  end
end
