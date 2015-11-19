require 'faker'

# create extra users

4.times do
  User.create!(
    name: Faker::Name.name,
    email: "#{Faker::Team.creature}@gmail.com",
    password: "foobar",
    password_confirmation: "foobar")
end

user = User.first.update_attributes!(
  name: "Andrea",
  email: "andrealankao@gmail.com")

user = User.last.update_attributes!(
  name: "Avocado",
  email: "eirinikos@gmail.com")

users = User.all

# create applications

3.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Team.creature,
    url: "http://#{Faker::Team.creature}.io")
end

3.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Hacker.verb,
    url: "http://#{Faker::Hacker.verb}.io")
end

3.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Lorem.word,
    url: "http://#{Faker::Lorem.word}.io")
end

apps = RegisteredApplication.all

# create events

18.times do
  Event.create!(
    registered_application: apps.sample,
    name: "#{Faker::Hacker.verb} the #{Faker::Hacker.noun}")
end

puts "C'est fini!"
puts "#{User.count} utilisateurs ont été créés!"
puts "#{RegisteredApplication.count} applications ont été créés!"
puts "#{Event.count} évènements ont été créés!"