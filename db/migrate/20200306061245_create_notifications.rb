class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :client, null:false, index:true, foreign_key: {to_table: :users}
      t.string :text, null:false

      t.timestamps
    end
  end
end
