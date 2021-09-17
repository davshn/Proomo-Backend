class AddColumnsSchedulesAndValidDateToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :commerces, :nit, :string, null: true
    add_column :offers, :schedule, :jsonb, defaul: {}
    add_column :offers, :valid_date, :string, null: true
  end
end
