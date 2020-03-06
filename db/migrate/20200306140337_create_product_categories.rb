class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.references :category, null:false, index:true, foreign_key: {to_table: :users}
      t.references :product, null:false, index:true, foreign_key: true

      t.timestamps
    end
  end
end
