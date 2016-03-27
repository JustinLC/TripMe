require 'faker'

# Create users
user = User.create!(
  name: 'Jesse',
  email: 'jesse@example.com',
  password: 'jesse'
)
user = User.create!(
  name: 'Justin',
  email: 'justin@example.com',
  password: 'justin'
)
user = User.create!(
  name: 'German',
  email: 'german@example.com',
  password: 'german'
)

20.times do
  tripname = Faker::StarWars.planet
  destination = Faker::Address.country
  user.trips.create!(
    tripname: tripname,
    destination: destination,
  )
end