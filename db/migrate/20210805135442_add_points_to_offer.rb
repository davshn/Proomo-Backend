class AddPointsToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :by_points, :boolean, default: false
    add_column :offers, :redeem_points, :integer, default: 0
  end
end
