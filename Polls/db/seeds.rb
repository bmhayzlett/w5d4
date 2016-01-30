250.times do
  User.create!(user_name: Faker::Name.name)
end

10.times do
  Poll.create!(title: Faker::Hipster.sentence, author_id: User.first.id)
end

Poll.all.each do |poll|
  Question.create!(text: Faker::Hipster.paragraph, poll_id: poll.id)
end

Question.all.each do |question|
  5.times do
    AnswerChoice.create!(question_id: question.id, answer_text: Faker::Book.title)
  end
end

@user_array = *(2..250)
AnswerChoice.all.each do |answer_choice|
  rand(1..5).times do
    unless @user_array.empty?
      Response.create!(responder_id: @user_array.pop , answer_choice_id: answer_choice.id)
    end
  end
end
