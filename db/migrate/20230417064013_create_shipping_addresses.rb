class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.integer :id
      t.integer :customer_id
      t.string :name
      t.string :address
      t.string :post_code
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
