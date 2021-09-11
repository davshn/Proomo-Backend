class Commerce < ApplicationRecord
  has_many :products
  has_many :offers
  has_many :notifications
  has_many :advertisements
  has_and_belongs_to_many :categories
  belongs_to :partner

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image,
      :description,
      :category_ids,
      :city,
      :published,
      :contact_email,
      :partner_id
    ]
  end
  mount_base64_uploader :image, ImageUploader
end
