20.times do
  User.create!(user_name: Faker::Name.name)
end

30.times do
  Poll.create!(title: Faker::Hipster.sentence, author_id: rand(1..20))
end

50.times do
  Question.create!(text: Faker::Hipster.paragraph, poll_id: rand(1..30))
end
