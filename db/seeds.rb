# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
puts "cleaning the database"
User.delete_all
Post.delete_all
Category.delete_all

puts "creating seeds"

20.times do
  User.create(
    # each user is assigned an id from 1-20
    name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Name.name,
    # issue each user the same password
    password: 'password'
  )
end

20.times do
  Category.create(
    name: Faker::Name.name
  )
end

20.times do
  Post.create(
    title: Faker::Hipster.sentences.sample,
    contents: Faker::Lorem.paragraphs,
    image_url: URI.open('https://picsum.photos/200/300'),
    user_id: [1, 3, 4, 5, 6, 7, 8].sample,
    category_id: [1, 3, 4, 5, 6, 7, 8].sample
  )
end

puts 'all done'
