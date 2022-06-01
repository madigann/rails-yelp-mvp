# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
restaurant_ids = []


puts "Cleaning restaurant database..."
Restaurant.destroy_all

puts "Creating restaurants..."
10.times do
  restaurant = Restaurant.create(  name: Faker::Restaurant.name,
                      address: Faker::Address.street_name,
                      phone_number: Faker::PhoneNumber.phone_number,
                      category: ["chinese", "italian", "japanese", "french", "belgian"].sample)
  restaurant_ids.append restaurant.id
end
puts "Finished creating restaurants!"


puts "Cleaning review database..."
Review.destroy_all

puts "Creating reviews..."
10.times do
  Review.create(restaurant: Restaurant.find(restaurant_ids.sample), rating: Faker::Number.between(from: 0, to: 5), content: Faker::Restaurant.review)
end
puts "Finished creating reviews!"
