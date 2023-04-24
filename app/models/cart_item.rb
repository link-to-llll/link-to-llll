class CartItem < ApplicationRecord
belongs_to :order
belongs_to :customer
belongs_to :product

def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
  item.taxin_price*quantity
end
end
