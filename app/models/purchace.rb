class Purchace < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :state,
      :client_id
    ]
  end
end
