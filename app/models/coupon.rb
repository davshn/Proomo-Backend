class Coupon < ApplicationRecord
  belongs_to :client
  belongs_to :offer
  
  def self.get_params(exclude = [])
    params = [
      :id,
      :client_id,
      :offer_id,
      :image
    ]
  end


  mount_base64_uploader :image, ImageUploader
end
