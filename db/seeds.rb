# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@admin',password: 'testtest')

#hashimoto-branch
Genre.create!(name: 'cake')
Genre.create!(name: 'pudding')
Genre.create!(name: 'baked goods')
Genre.create!(name: 'candy')

# 最新の注文は個別で作る
Order_product.create(
  quantity: 2,
  buy_price: '200',
  status: 0,
  order_id: 2,
  product_id: 1)

Order.create(
  shipping_name: kyariy,
  customer_id: 3,
  product_id: 1)

  Product.create(
  genre_id: 1,
  name: '焼き菓子',
  price: '300')

Genre.create!(name: '焼き菓子')
