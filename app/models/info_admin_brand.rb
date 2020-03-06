class InfoAdminBrand < ApplicationRecord
  def self.get_params(exclude = [])
    params = [
      :id,
      :user_id,
      :commerce_id
    ]
  end
end
