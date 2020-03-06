class Offer < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :title
    ]
  end
end
