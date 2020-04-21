class AddToCommerceAndCouponsFields < ActiveRecord::Migration[5.2]
  def change
    add_column :commerces, :description, :string
    add_column :commerces, :score, :float
    add_column :offers, :description, :string
    add_column :offers, :terms_and_conditions, :string
  end
end
