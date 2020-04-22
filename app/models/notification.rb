class Notification < ApplicationRecord
  belongs_to :commerce
  def self.get_params(exclude = [])
    params = [
      :id,
      :commerce_id,
      :text,
      :title
    ]
  end
end
