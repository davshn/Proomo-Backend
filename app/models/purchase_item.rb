class PurchaseItem < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :product_id,
      :quantity,
      :unit_price
    ]
  end
end
