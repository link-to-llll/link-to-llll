class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.string :id
      t.string :product_id
      t.string :customer_id
      t.string :quantity
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
