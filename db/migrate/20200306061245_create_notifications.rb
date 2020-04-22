class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :commerce, null:false, index:true, foreign_key:true
      t.string :text, null:false
      t.string :title, null:false
      t.boolean :published, null:false, default:false
      t.timestamps
    end
  end
end
