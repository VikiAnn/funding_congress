require 'rails_helper'

describe "ContributorsIngester" do
  it "should create contributors within a given year for a legislator from an api response" do
    legislator = create(:legislator)

    response = [ build_contributor_hash("name" => "University of California"),
                 build_contributor_hash("name" => "Microsoft Corp") ]

    contributors = ContributorsIngester.ingest(response, legislator.id)

    expect(contributors.all? { |contributor| contributor.class == Contributor })

    expect(Contributor.all.count). to eq(2)
    expect(Contributor.find_by(name: "University of California").legislator).to eq(legislator)
    expect(Contributor.find_by(name: "Microsoft Corp").legislator).to eq(legislator)
    expect(Contributor.find_by(name: "University of California").cycle).to eq("2012")
    expect(Contributor.find_by(name: "Microsoft Corp").cycle).to eq("2012")
  end

  def build_contributor_hash(attributes_hash)
     { "employee_amount" => "1504133.00",
       "cycle" => "2012",
       "total_amount" => "1504133.00",
       "total_count" => "3074",
       "name" => "University of California",
       "direct_count" => "0",
       "employee_count" => "3074",
       "direct_amount" => "0" }.merge(attributes_hash)
  end
end
