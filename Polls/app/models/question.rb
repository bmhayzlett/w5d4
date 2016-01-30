# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :responses,
    through: :answer_choices,
    source: :responses

  # Returns hash of choices and counts of answers to those choices
  def results
    results = Hash.new
    self.answer_choices.each do |answer_choice|
      results[answer_choice.answer_text] = answer_choice.responses.count
    end
    results
  end

  def results_better
    results = Hash.new
    answer_choices = self.answer_choices.includes(:responses)
    answer_choices.each do |answer_choice|
      results[answer_choice.answer_text] = answer_choice.responses.length
    end
    results
  end

  # def results_best
  #   AnswerChoice.find_by_sql(<<-SQL, self.id)
  #     SELECT answer_choices.*, COUNT(responses.id)
  #     FROM answer_choices
  #     JOIN responses ON answer_choices.id = responses.answer_choice_id
  #     WHERE answer_choices.question_id = ?
  #     GROUP BY answer_choices.id
  #     SQL
  # end

  def results_best
    results = Hash.new
    answer_choices = self.answer_choices
        .select("answer_choices.*, COUNT(responses.id) AS response_count")
        .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
        .group("answer_choice_id")
    answer_choices.each do |answer_choice|
      results[answer_choice.answer_text] = answer_choice.response_count
    end
    results
  end
end
