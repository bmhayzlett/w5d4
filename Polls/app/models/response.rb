class Response < ActiveRecord::Base
  validates :responder_id, :answer_choice_id, presence: true
  validate :responder_can_only_answer_question_once
  validate :responder_cannot_be_poll_author

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

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def responder_already_answered?
    sibling_responses.exists?(responder_id: self.responder_id)
  end

  def responder_is_author?
    self.answer_choice.question.poll.author_id == self.responder_id
  end

  private
  def responder_can_only_answer_question_once
    if responder_already_answered?
      errors[:response] << "Cannot answer same question more than once"
    end
  end

  def responder_cannot_be_poll_author
    if responder_is_author?
      errors[:response] << "Cannot respond as poll author"
    end
  end
end
