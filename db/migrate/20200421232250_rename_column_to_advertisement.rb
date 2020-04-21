class RenameColumnToAdvertisement < ActiveRecord::Migration[5.2]
  def change
    rename_column :advertisements, :type, :advertisement_type
  end
end
