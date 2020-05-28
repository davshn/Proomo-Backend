class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :last_name, :string
    add_column :users, :last_second_name, :string
    add_column :users, :user_name, :string
    add_column :users, :phone, :string
    add_column :users, :birthday, :datetime
    add_column :users, :genre, :string
  end
end
