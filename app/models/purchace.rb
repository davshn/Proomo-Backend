class Purchace < ApplicationRecord
  belongs_to :client
  has_many :purchase_items

  def self.get_params(exclude = [])
    params = [
      :state,
      :client_id,
      :offer_id,
      :commerce_id
    ]
  end
end
