# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@admin',password: 'testtest')





  Product.create!(
  genre_id: 1,
  name: 'ケーキ',
  explanation: '甘い',
  price: '200',
  status: true)

#hashimoto-branch
Genre.create!(name: 'cake')
Genre.create!(name: 'pudding')
Genre.create!(name: 'baked goods')
Genre.create!(name: 'candy')
Genre.create!(name: '焼き菓子')
