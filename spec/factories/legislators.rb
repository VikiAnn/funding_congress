FactoryGirl.define do
  factory :legislator do
    sequence(:bioguide_id) { |n| "A#{n.to_s.rjust(6, "0")}"}
    in_office true
    party { ["D", "I", "R"].sample }
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    middle_name Faker::Name.first_name
    nickname "Bobby Jo"
    gender { ["M", "F"].sample }
    state Faker::Address.state_abbr
    title { ["Sen", "Rep", "Del", "Com"].sample }
    chamber { ["senate", "house"].sample }
  end
end
