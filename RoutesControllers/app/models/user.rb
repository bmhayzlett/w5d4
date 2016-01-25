class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Contact',
    dependent: :destroy

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ContactShare',
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact
end
