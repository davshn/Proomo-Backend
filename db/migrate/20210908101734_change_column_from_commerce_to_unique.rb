class ChangeColumnFromCommerceToUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :commerces, :name, unique: true
  end
end
