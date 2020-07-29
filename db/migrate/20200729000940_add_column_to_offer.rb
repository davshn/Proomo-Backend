class AddColumnToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :discount_value, :integer, default: 0
  end
end
