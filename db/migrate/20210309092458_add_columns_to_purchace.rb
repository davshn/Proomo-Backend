class AddColumnsToPurchace < ActiveRecord::Migration[5.2]
  def change
    add_column :purchaces, :offer_id, :integer, null:true
    add_column :purchaces, :validate_sale, :boolean, default: false
  end
end
