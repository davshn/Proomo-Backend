class InfoClient < ApplicationRecord
  belongs_to :client
  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :full_name
    ]
  end
end
