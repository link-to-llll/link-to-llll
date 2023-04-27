class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_name
      t.string :shipping_postal_code
      t.string :shipping_address
      t.integer :payment_method
      t.integer :amount_billed
      t.integer :postage
      t.integer :status, default: 0

      t.timestamps
    end
  end
end