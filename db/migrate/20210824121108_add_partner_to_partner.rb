class AddPartnerToPartner < ActiveRecord::Migration[5.2]
  def change
    add_reference :partners, :parent_partner, index: true
  end
end
