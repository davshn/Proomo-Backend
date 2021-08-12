class AddPriceAndValidationForOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :is_online_product, :boolean, default: false
    add_column :offers, :price, :integer, default: 0
  end
end
