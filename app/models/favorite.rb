class Favorite < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :product_id
    ]
  end
end
