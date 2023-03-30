# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Hai Phong",
    email: "haiphong.huynh01@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    )
    20.times do |n|
        name  = Faker::Name.name
        email = "ex#{n+1}@gmail.com"
        password = "password"
        User.create!(name:  name,
         email: email,
         password:password,
         password_confirmation: password,
        )

    Category.create!(name: "Foods", status: 1)
    Category.create!(name: "Drinks", status: 1)
      
    25.times do |n|
        category_id = 1
        name = "Foods#{n+1}"
        price = 200
        quantity = 10
        description = "Food"
        picture = "https://i.ibb.co/BZtH15r/banhmi.jpg"
        avg_rating = 4.3
      
        Product.create!(
          category_id: category_id,
          name: name,
          price: price,
          quantity: quantity,
          description: description,
          avg_rating: avg_rating,
          picture: picture
        )
      end
      
    25.times do |n|
        category_id = 2
        name = "Drinks#{n+1}"
        price = 333
        quantity = 10
        description = "Drink"
        picture = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr00SZ8iUGqQxytSec-jdmILhkUwL36D2aWsrhByx7Qooamf1W"
        avg_rating = 4.3
      
        Product.create!(
          category_id: category_id,
          name: name,
          price: price,
          quantity: quantity,
          description: description,
          avg_rating: avg_rating,
          picture: picture
        )
    end