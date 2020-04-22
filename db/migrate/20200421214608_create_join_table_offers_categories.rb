class CreateJoinTableOffersCategories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :offers, :categories do |t|
      t.references :offer, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
