# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'


AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456')

images = ['deer', 'fall', 'girl', 'ghost', 'house', 'kitten', 'lake', 'pool', 'sport', 'sunset']
fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')

5.times do
  User.create(
    name: FFaker::Name.name, 
    email: FFaker::Internet.email, 
    password: '123456', 
    password_confirmation: '123456'
  )
end

User.create(name: 'Maria', email: 'maria@example.com', password: '123456', password_confirmation: '123456')

users = User.all

for i in 0...images.size
  img = images[i]
  Photo.create({
  :name => img, 
  :image => File.new("#{Rails.root}/app/assets/images/fixtures/#{img}.jpg"),
  # :user_id => rand(1..6)
  user: users[rand(0...users.size)]
})
end

photos = Photo.all

50.times do
  UserComment.create(
    body: FFaker::Lorem.sentence(3), 
    user: users[rand(0...users.size)],
    photo: photos[rand(0...photos.size)],
    score: rand(1..5)
  )
end