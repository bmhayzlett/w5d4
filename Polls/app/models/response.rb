class Response < ActiveRecord::Base
  validates :responder_id, :answer_choice_id, presence: true

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :responder,
    primary_key: :id,
    foreign_key: :responder_id,
    class_name: 'User'

  has_one :question,
    through: :answer_choice,
    source: :question
end
