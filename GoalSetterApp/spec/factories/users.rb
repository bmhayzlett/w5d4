FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password 'password'

    trait :no_username do
      username ''
    end

    trait :no_password do
      password ''
    end
  end
end
