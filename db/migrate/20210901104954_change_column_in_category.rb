class ChangeColumnInCategory < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :image, :string, null: true
  end
end
