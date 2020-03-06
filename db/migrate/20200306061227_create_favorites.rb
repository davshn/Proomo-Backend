class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :client, null:false, index:true, foreign_key: {to_table: :users}
      t.references :product, null:false, index:true, foreign_key: true

      t.timestamps
    end
  end
end
