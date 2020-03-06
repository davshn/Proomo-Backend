class Purchace < ApplicationRecord
  belongs_to :client
  has_many :purchase_items
  
  def self.get_params(exclude = [])
    params = [
      :state,
      :client_id
    ]
  end
end
