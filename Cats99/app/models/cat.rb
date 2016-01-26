class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: ['M', 'F']
  validates :color, inclusion: ['Italian Sky Blue', 'Japanese Indigo', 'Islamic Green', 'Fuzzy Wuzzy', 'Dark Gunmetal', 'Orioles Orange', 'Pale Robin Egg Blue', 'Permanent Geranium Lake', 'Phthalo Blue', 'Zomp', 'Zaffre']

  def age
    days_diff = Date.today - birth_date
    days_diff.to_i / 365
  end

end
