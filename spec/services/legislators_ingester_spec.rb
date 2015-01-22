require 'rails_helper'

describe "LegislatorsIngester" do
  it "should create legislators for a given zipcode from an api response" do
    response = {"results"=>
      [ build_legislator_hash("last_name"=>"Gardner"),
        build_legislator_hash("last_name"=>"DeGette"),
        build_legislator_hash("last_name"=>"Bennet") ],
     "count"=>3,
     "page"=>{"count"=>3, "per_page"=>20, "page"=>1}}

    legislators = LegislatorsIngester.ingest("80203", response)

    expect(legislators.all? { |legislator| legislator.class == Legislator })
    expect(legislators.all? { |legislator| legislator.zipcode == "80203" })

    expect(Legislator.count).to eq(3)
    expect(Legislator.first.last_name).to eq("Gardner")
    expect(Legislator.second.last_name).to eq("DeGette")
    expect(Legislator.last.last_name).to eq("Bennet")
  end

  def build_legislator_hash(attributes_hash)
    { "bioguide_id"=>"G0005#{Random.rand(1000)}2",
      "chamber"=>"senate",
      "first_name"=>"Cory",
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
      "youtube_id"=>"CongressmanGardner" }.merge(attributes_hash)
  end
end
