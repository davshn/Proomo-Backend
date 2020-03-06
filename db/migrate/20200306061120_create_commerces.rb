class CreateCommerces < ActiveRecord::Migration[5.2]
  def change
    create_table :commerces do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
