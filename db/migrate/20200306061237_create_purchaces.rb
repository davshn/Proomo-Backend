class CreatePurchaces < ActiveRecord::Migration[5.2]
  def change
    create_table :purchaces do |t|
      t.references :client, null:false, index:true, foreign_key: {to_table: :users}
      t.string :state, null:false, default: "CREADO"
      t.timestamps
    end
  end
end
