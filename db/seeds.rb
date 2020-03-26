50.times do |n|
  name = Faker::Games::Pokemon.unique.name
  email = Faker::Internet.unique.email
  password = "password"
  introduction = Faker::Music.album
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               introduction: introduction,
               )
end