# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create(first_name: Faker::LordOfTheRings.character, last_name: Faker::StarTrek.specie, company: Faker::Company.name, address: Faker::Address.street_address, city: Faker::StarTrek.location, state: Faker::Address.state_abbr, zip: "00000", email: Faker::Internet.email, password: 'password')
end

40.times do
  Product.create(grower: User.find(rand(1..20)), name: Faker::Food.ingredient, price: "10.00", unit: Faker::Food.metric_measurement)
end

30.times do
  Event.create(name: Faker::Hipster.sentence(3), description: Faker::StarWars.quote, start_time: "09-09-09 10:10:10", end_time: "10-10-10 11:11:00", event_url: "https://github.com/stympy/faker", address: Faker::Address.street_address, city: Faker::StarTrek.location, state: Faker::Address.state_abbr, map_url: 'https://goo.gl/maps/7DNC7RqiEgP2' )
end
