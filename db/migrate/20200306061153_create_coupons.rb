class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.references :client, null:false, index:true, foreign_key: {to_table: :users}
      t.references :offer, null:false, foreign_key: true
      t.string :image, null:false
      
      t.timestamps
    end
  end
end
