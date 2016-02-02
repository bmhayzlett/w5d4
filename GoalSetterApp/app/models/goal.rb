class Goal < ActiveRecord::Base
  validates :title, :user_id, :target_date, presence: true
  validates :complete, :public, inclusion: [true, false]

  belongs_to :user

  def self.public_goals
    Goal.all.select { |goal| goal.public }
  end

end
