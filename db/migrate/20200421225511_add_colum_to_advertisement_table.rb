class AddColumToAdvertisementTable < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :type, :string
    add_reference :advertisements, :commerce, foreign_key: true
    add_column :advertisements, :title, :string
    add_column :advertisements, :text, :string
    add_column :advertisements, :link, :integer
  end
end
