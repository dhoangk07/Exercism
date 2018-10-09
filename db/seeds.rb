
Exercise.delete_all
# Tag.delete_all
Tagging.delete_all
Solution.delete_all

90.times do |n|
  title = Faker::Food.dish 
  difficulty = Exercise.difficulties.keys.sample
  introduction = Faker::Lorem.paragraph(500)
  Exercise.create!(title: title, difficulty: difficulty, introduction: introduction)
end

# 20.times do |n|
#   name = Faker::Food.vegetables
#   Tag.create!(name: name)
# end

300.times do |n|
  name = Faker::Friends.character
  email = Faker::Internet.email 
  password = Faker::Internet.password
  password_confirmation = password
  User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation)
end

190.times do |n|
  Tagging.create!(tag_id: Tag.pluck(:id).sample, exercise_id: Exercise.pluck(:id).sample)
end

exercises = Exercise.take(30)
30.times do |n|
  content = Faker::Lorem.paragraph(150)
  status = Solution.statuses.keys.sample
  exercises.each{|exercise| exercise.solutions.create!(content: content, status: status, user_id: User.pluck(:id).sample)}
end








