class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :commerce, null:false, index:true, foreign_key: true
      t.string :name, null:false
      t.string :image, null:false
      t.decimal :price, null:false

      t.timestamps
    end
  end
end
