class CreateInfoClients < ActiveRecord::Migration[5.2]
  def change
    create_table :info_clients do |t|
      t.references :client, null:false, index:true, foreign_key: {to_table: :users}
      t.string :full_name

      t.timestamps
    end
  end
end
