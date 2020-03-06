class InfoAdminBrand < ApplicationRecord
  belongs_to :admin_brand
  def self.get_params(exclude = [])
    params = [
      :id,
      :admin_brand_id,
      :commerce_id
    ]
  end
end
