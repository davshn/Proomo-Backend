class Notification < ApplicationRecord
  belongs_to :client
  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :text
    ]
  end
end
