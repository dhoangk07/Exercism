# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Exercise.delete_all
#==> create user
# 10.times do |n|
#   name = Faker::FunnyName.two_word_name
#   email = Faker::Internet.email
#   User.create!(name: name, email: email)  
# end

#==> create exercise
90.times do |n|
  title = Faker::Food.dish 
  difficulty = Exercise.difficulties.keys.sample
  Exercise.create!(title: title, difficulty: difficulty)
end
#==> create solution
# users = User.all
# 90.times do |m|
#   content = Faker::Lorem.sentences(5)
#   users.each{ |user| user.solutions.create!(content: content)}
# end










