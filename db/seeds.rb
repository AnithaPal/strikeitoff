require 'faker'

10.times do 

  user = User.new(
    name:  Faker::Name.name,
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(8))
  user.skip_confirmation!
  user.save!
end

user = User.new(
  name: 'User',
  email: 'User@example.com',
  password: 'helloworld')
user.skip_confirmation!
user.save!

users = User.all


30.times do
  item = Item.new(
    user: users.sample,
    name: Faker::Lorem.sentence)
  item.save!
end

puts "Seeding Finished"
puts "#{User.count} users created."
puts "#{Item.count} items created."