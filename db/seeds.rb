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
image_sample =["https://img.newatlas.com/reflex-camera-2.jpg?auto=format%2Ccompress&ch=Width%2CDPR&fit=crop&h=347&q=60&rect=62%2C0%2C874%2C491&w=616&s=3f02f39401c8ee826767d1168ce0b174","https://icdn3.digitaltrends.com/image/sony-cyber-shot-rx100-9-1500x1000.jpg", "https://cdn.pixabay.com/photo/2016/12/27/19/23/camera-1934649_960_720.jpg","https://i.pinimg.com/originals/da/80/1c/da801cd9320c92b9f8424d176d2c9f4d.jpg","https://petapixel.com/assets/uploads/2016/05/two-800x533.jpg","https://nikonrumors.com/wp-content/uploads/2016/04/DSC0337-550x348.jpg","https://media.wired.com/photos/5b64db3717c26f0496f4d62d/4:3/w_700,c_limit/Canon-G7XII-SOURCE-Canon.jpg", "https://cdn.thewirecutter.com/wp-content/uploads/2018/04/canon-dslrs-march-2018-2x1-lowres3496.jpg", "https://cdn.mos.cms.futurecdn.net/ajjJB6ZAYH67XM5B3xo74G-970-80.jpg", "https://www.juzaphoto.com/shared_files/articles/canon_600_f4_is_review/juza_handholding_canon600f4is-720px.jpg"]
puts 'Create 10 fake sale items'
10.times do
  sale_item = SaleItem.new(
      model: Faker::Games::Pokemon.name,
      daily_rate: rand(5..25),
      set_up_rate: rand(10..40),
      user: User.all.sample,
      start_date: Date.today + rand(1..30),
      end_date: Date.today + rand(31..200),
      city: city_sample.sample,
  )
  sale_item.remote_photo_url = image_sample.sample
  sale_item.save!
end

puts 'Create 100 fake bookings'

100.times do
  booking = Booking.new(
    sale_item: SaleItem.all.sample,
    start_date: Date.today + rand(1..30),
    end_date: Date.today + rand(31..40),
    user: User.all.sample,
    pick_up_location: Faker::Address.street_name,
    drop_off_location: Faker::Address.street_name)
  booking.save!
end
