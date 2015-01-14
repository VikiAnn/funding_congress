FactoryGirl.define do
  factory :user do
    provider "facebook"
    sequence(:uid) { |n| "#{n.to_s.rjust(15, "0")}"}
    name Faker::Name.name
    sequence(:email) { |n| "#{name}#{n}@example.com" }
    sequence(:token) { |n| "ABC#{n.to_s.rjust(15, "0")}"}
  end
end
