class Product < ApplicationRecord

  #hashimoto-branch
  belongs_to :genre

  #furunagayuta
  has_many :cart_items, dependent: :destroy
  has_many :order_product

  has_one_attached :image

  with_options presence: true do
   validates :genre_id
   validates :name
   validates :explanation
   validates :price
   validates :status
   validates :image
  end

end
