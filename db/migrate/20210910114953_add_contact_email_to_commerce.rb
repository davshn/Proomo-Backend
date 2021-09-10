class AddContactEmailToCommerce < ActiveRecord::Migration[5.2]
  def change
    add_column :commerces, :contact_email, :string, null: true
  end
end
