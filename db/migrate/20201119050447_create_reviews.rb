class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reason
      t.integer :score
      t.references :client, null:false, index:true, foreign_key: {to_table: :users}
      t.references :commerce, foreign_key: true

      t.timestamps
    end
  end
end
