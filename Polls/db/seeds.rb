20.times do
  User.create!(user_name: Faker::Name.name)
end

User.all.each do |user|
  Poll.create!(title: Faker::Hipster.sentence, author_id: user.id)
end

Poll.all.each do |poll|
  Question.create!(text: Faker::Hipster.paragraph, poll_id: poll.id)
end

Question.all.each do |question|
  AnswerChoice.create!(question_id: question.id, answer_text: Faker::Book.title)
end

@user_array = *(1..20)
AnswerChoice.all.each do |answer_choice|
  Response.create!(responder_id: @user_array.pop , answer_choice_id: answer_choice.id)
end
