class AddCitiesToUsersAndCommerces < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string, null: true
    add_column :commerces, :city, :string, null: true
    add_column :users, :latitude, :string, null: true
    add_column :users, :longitude, :string, null: true
    add_column :users, :notifications_id, :string, null: true
  end
end
