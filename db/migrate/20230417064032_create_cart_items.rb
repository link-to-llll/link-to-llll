class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
<<<<<<< HEAD
      t.string :product_id
      t.string :customer_id
      t.string :quantity
      
=======

      t.string :product_id
      t.string :customer_id
      t.string :quantity

>>>>>>> origin/develop
      t.timestamps
    end
  end
end
