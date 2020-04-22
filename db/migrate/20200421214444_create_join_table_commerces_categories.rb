class CreateJoinTableCommercesCategories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :commerces, :categories do |t|
      t.references :commerce, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
