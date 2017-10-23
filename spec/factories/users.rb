FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| Faker::Internet.safe_email "user#{n}" }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
