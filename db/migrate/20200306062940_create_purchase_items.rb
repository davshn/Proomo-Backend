class CreatePurchaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_items do |t|
      t.references :product, null: false, index:true
      t.decimal :quantity, null:false, default:1
      t.decimal :unit_price, null:false

      t.timestamps
    end
  end
end
