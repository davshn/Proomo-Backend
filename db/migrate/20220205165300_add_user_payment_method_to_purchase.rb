class AddUserPaymentMethodToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchaces, :user_payment_method, :string, default: "online"
  end
end
