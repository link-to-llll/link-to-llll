class Product < ApplicationRecord

  with_options presence: true do
   validates :genre_id
   validates :name
   validates :explanation
   validates :price
   validates :stock
   validates :image
 end
 has_one_attached :image
end
