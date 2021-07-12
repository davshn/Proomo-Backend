class AddCommerceToPurchace < ActiveRecord::Migration[5.2]
  def change
    add_column :purchaces, :commerce_id, :integer, null:true
  end
end
