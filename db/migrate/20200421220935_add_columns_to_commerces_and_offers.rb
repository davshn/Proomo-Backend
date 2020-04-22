class AddColumnsToCommercesAndOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :commerces, :published, :boolean, :default => false
    add_column :offers, :published, :boolean, :default => false
    add_column :offers, :image, :string
  end
end
