FactoryBot.define do
  factory :book do
    association :author
    sequence(:title) {|n| "ためになる本 第#{n}巻" }
  end
end
