require 'faker'

# Create users
user = User.create!(
  name: 'jesse',
  email: 'jesse@example.com',
  password: 'jesse'
)
user = User.create!(
  name: 'justin',
  email: 'justin@example.com',
  password: 'justin'
)
user = User.create!(
  name: 'german',
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