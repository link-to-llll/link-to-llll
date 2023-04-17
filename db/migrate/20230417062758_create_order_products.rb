class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
     t.integer :order_id
     t.integer :product_id
     t.integer :quantity
     t.integer :buy_price
     t.integer :status, null: false, default: true

      t.timestamps
    end
  end
end
