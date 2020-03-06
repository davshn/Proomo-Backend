class Notification < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :text
    ]
  end
end
