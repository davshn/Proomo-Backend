class AddReferencesAndPublishedColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :commerce, index: true
    add_reference :advertisements, :category, index: true
    add_column :advertisements, :published, :boolean, :default => false
    add_column :notifications, :published, :boolean, :default => false
  end
end
