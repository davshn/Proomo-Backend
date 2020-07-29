class AddColumnsToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :concept_name, :string, default: "Producto"
    add_reference :categories, :principal_category, index: true
  end
end
