class OrderProduct < ApplicationRecord
belongs_to :order
belongs_to :product
enum status: { cannot_start: 0, waiting_for_production: 1, production: 2, completion_of_production: 3 }
def sum_price 
    buy_price*quantity
end
end
