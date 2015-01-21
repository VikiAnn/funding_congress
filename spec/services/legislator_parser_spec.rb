require 'rails_helper'

describe "LegislatorParser" do
  it "should create legislators from an api response" do
    response = {"results"=>
      [{"bioguide_id"=>"G000562",
          "chamber"=>"senate",
          "last_name"=>"Gardner",
          "middle_name"=>nil,
          "office"=>"B40b Dirksen Senate Office Building",
          "party"=>"R",
          "phone"=>"202-224-5941",
          "term_end"=>"2021-01-03",
          "term_start"=>"2015-01-06",
          "title"=>"Sen",
          "twitter_id"=>"RepCoryGardner",
          "website"=>"http://www.gardner.senate.gov",
          "youtube_id"=>"CongressmanGardner"},
         {"bioguide_id"=>"D000197",
          "chamber"=>"house",
          "facebook_id"=>"110757973488",
          "first_name"=>"Diana",
          "last_name"=>"DeGette",
          "middle_name"=>"L.",
          "office"=>"2368 Rayburn House Office Building",
          "party"=>"D",
          "phone"=>"202-225-4431",
          "term_end"=>"2017-01-03",
          "term_start"=>"2015-01-06",
          "title"=>"Rep",
          "twitter_id"=>"RepDianaDeGette",
          "website"=>"http://degette.house.gov",
          "youtube_id"=>"RepDianaDeGette"},
         {"bioguide_id"=>"B001267",
          "chamber"=>"senate",
          "facebook_id"=>"97172997732",
          "first_name"=>"Michael",
          "last_name"=>"Bennet",
          "middle_name"=>"F.",
          "office"=>"458 Russell Senate Office Building",
          "party"=>"D",
          "phone"=>"202-224-5852",
          "term_end"=>"2017-01-03",
          "term_start"=>"2011-01-05",
          "title"=>"Sen",
          "twitter_id"=>"SenBennetCo",
          "website"=>"http://www.bennet.senate.gov",
          "youtube_id"=>"SenatorBennet"}],
     "count"=>3,
     "page"=>{"count"=>3, "per_page"=>20, "page"=>1}}

    legislators = LegislatorParser.parse(response)

    legislators.each do |legislator|
      expect(legislator.class).to eq Legislator
    end

    expect(legislators.first.last_name).to eq("Gardner")
    expect(legislators.second.last_name).to eq("DeGette")
    expect(legislators.last.last_name).to eq("Bennet")
  end
end
