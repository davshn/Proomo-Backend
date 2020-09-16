class AddColumnToTicketIdForPurchaces < ActiveRecord::Migration[5.2]
  def change
    add_column :purchaces, :ticket_id, :integer
    add_column :purchaces, :trazability_code, :integer
    add_column :purchaces, :return_code, :string
    add_column :purchaces, :total, :integer
    add_column :purchaces, :trans_value, :integer
    add_column :purchaces, :bank_process_date, :datetime
    add_column :purchaces, :fi_code, :integer
    add_column :purchaces, :fi_name, :string
    add_column :purchaces, :payment_system, :integer
    add_column :purchaces, :invoice, :integer
  end
end
