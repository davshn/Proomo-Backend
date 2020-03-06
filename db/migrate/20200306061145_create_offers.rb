class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :commerce, null:false, index:true, foreign_key:true
      t.string :title

      t.timestamps
    end
  end
end
