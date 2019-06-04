# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'

puts 'Creating 20 fake users...'
20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password"
    )
  user.save!
end

city_sample = ["london","paris","munich"]
puts 'Create 10 fake sale items'
10.times do
  sale_item = SaleItem.new(
      model: Faker::Games::Pokemon.name,
      daily_rate: rand(5..25),
      set_up_rate: rand(10..40),
      user: User.all.sample,
      start_date: Date.today + rand(1..30),
      end_date: Date.today + rand(31..200),
      city: city_sample.sample
  )
  sale_item.save!
end
