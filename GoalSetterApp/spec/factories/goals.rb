FactoryGirl.define do
  factory :goal do
    title Faker::Book.title
    user_id 1
    target_date Faker::Date.forward
    public [true, false].sample
    complete [true, false].sample

    trait :no_title do
      title ''
    end

    trait :no_user_id do
      user_id nil
    end

    trait :no_date do
      target_date ''
    end

    trait :no_public do
      public nil
    end

    trait :no_complete do
      complete nil
    end
  end
end
