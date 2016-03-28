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
  startdate = Faker::Date.between(Date.today, 100.days.from_now)
  enddate = Faker::Date.between(101.days.from_now, 200.days.from_now)
  user.trips.create!(
    tripname: tripname,
    destination: destination,
    startdate: startdate,
    enddate: enddate
  )
end