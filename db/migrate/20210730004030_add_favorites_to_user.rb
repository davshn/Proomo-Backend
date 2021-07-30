class AddFavoritesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorite_offers, :string, array: true, default: []
  end
end
