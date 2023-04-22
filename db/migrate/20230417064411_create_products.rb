class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      
     t.integer :genre_id
     t.string :name
     t.text :explanation
     t.integer :price
     t.boolean :status, null: false, default: true
     
     t.timestamps
    end
  end
end
