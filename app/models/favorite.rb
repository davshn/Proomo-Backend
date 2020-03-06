class Favorite < ApplicationRecord
  belongs_to :product
  belongs_to :client
  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :product_id
    ]
  end
end
