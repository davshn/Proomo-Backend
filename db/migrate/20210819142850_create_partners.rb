class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :documment
      t.string :documment_type

      t.timestamps
    end
  end
end
