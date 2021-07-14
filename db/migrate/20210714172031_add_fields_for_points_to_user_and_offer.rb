class AddFieldsForPointsToUserAndOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :points, :integer, default:0
    add_column :users, :total_points, :integer, default:0
    add_column :users, :spent_points, :integer, default:0
  end
end
