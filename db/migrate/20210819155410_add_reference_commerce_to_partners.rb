class AddReferenceCommerceToPartners < ActiveRecord::Migration[5.2]
  def change
    add_reference :commerces, :partner, index: true
  end
end
