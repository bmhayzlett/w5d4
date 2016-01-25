class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Contact'

  has_many :shared_contacts,
    through: :shared_contacts,
    source: :contact

  has_many :shared_contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ContactShare'
end
