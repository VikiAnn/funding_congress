FactoryGirl.define do
  factory :contributor do
    legislator

    name { Faker::Company.name }
    sequence(:sunlight_id) { |n| "afoibado9q34utfn#{n}" }
    total_amount { rand(100_000).to_f / 100 }
    cycle "2014"
  end
end
