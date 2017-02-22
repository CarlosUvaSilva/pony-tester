# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..10

  email = "user"+ i.to_s + "@example.com"
  full_name = Faker::GameOfThrones.character.split(" ")
  first_name = full_name[0]
  last_name = full_name[1]
  a_user = User.create(email: email, first_name: first_name, last_name: last_name, password: "lisbon2017")
  rand(0..5).times do
    pony_name = Faker::Cat.name
    pony_description = "This pony is very " + %w(gentle active strong fast beautiful smart).sample
    pony_description += " and is loved by most people that meet it. On top of that, " + Faker::Hipster.sentence
    location = Faker::Address.state
    a_pony = Pony.create(name: pony_name, description: pony_description, location: location, user: a_user)
    a_pony.photo_url = "http://loremflickr.com/320/240/pony"
    rand(0..10).times do
      start_date = Faker::Date.forward(30)
      end_date = start_date + rand(30..200)
      daily_rate = rand(100..200)
      PonyOffer.create(start_date: start_date, end_date: end_date, daily_rate: daily_rate, pony: a_pony, most_recent: true)
    end
  end
end
