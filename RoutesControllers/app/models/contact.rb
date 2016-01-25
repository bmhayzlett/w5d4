class Contact < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: { scope: :email }

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :shared_users,
    through: :shared_contacts,
    source: :user

  has_many :shared_contacts,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: 'ContactShare'
end
