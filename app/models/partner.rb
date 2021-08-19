class Partner < ApplicationRecord
  has_many :commerces
  has_many :referrals, class_name: 'Partner', foreign_key: "parent_partner_id", dependent: :destroy
  belongs_to :parent_partner, class_name: 'Partner', foreign_key: "parent_partner_id", optional: true


  def self.get_params(exclude = [])
    params = [
      :id,
      :name,
      :documment,
      :documment_type
    ]
  end
end
