20.times do
  User.create!(user_name: Faker::Name.name)
end

30.times do
  Poll.create!(title: Faker::Hipster.sentence, author_id: rand(1..20))
end

50.times do
  Question.create!(text: Faker::Hipster.paragraph, poll_id: rand(1..30))
end

250.times do
  AnswerChoice.create!(question_id: rand(1..50), answer_text: Faker::Book.title)
end

500.times do
  Response.create!(responder_id: rand(1..20), answer_choice_id: rand(1..250))
end
