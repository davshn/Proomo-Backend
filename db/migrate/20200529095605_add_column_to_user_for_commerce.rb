class AddColumnToUserForCommerce < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :commerce_ref, :integer
  end
end
