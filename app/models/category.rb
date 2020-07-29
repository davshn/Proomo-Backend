class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  has_and_belongs_to_many :offers
  has_and_belongs_to_many :commerces
  has_many :advertisements
  belongs_to :principal_category, :class_name => "Category", foreign_key: "principal_category_id", optional: true
  has_many :secundary_categories, :class_name => "Category", :foreign_key => 'principal_category_id'

  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :image,
      :concept_name,
      :principal_category_id
    ]
  end

  mount_base64_uploader :image, ImageUploader
end
