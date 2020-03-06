class CreateInfoAdminBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :info_admin_brands do |t|
      t.references :user, null:false, index:true, foreign_key:true
      t.references :commerce, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
