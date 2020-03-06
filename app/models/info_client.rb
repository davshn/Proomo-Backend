class InfoClient < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :user_id,
      :full_name
    ]
  end
end
