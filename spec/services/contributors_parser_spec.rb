require 'rails_helper'

describe "ContributorsParser" do
  it "should create contributors for a legislator from an api response" do
    legislator = create(:legislator)

    response = [ { "employee_amount": "1504133.00",
                   "total_amount": "1504133.00",
                   "total_count": "3074",
                   "name": "University of California",
                   "direct_count": "0",
                   "employee_count": "3074",
                   "id": "0e85264c0c0e4dfb9a4b38cfc181f030",
                   "direct_amount": "0"},
                 { "employee_amount": "814645.00",
                   "total_amount": "814645.00",
                   "total_count": "1241",
                   "name": "Microsoft Corp",
                   "direct_count": "0",
                   "employee_count": "1241",
                   "id": "f1244474fad44ad9a3a57859b4a709b1",
                   "direct_amount": "0" } ]

    contributors = ContributorsParser.parse(response, legislator.id)

    contributors.each do |contributor|
      expect(contributor.class).to eq Contributor
    end

    expect(contributors.first.name).to eq("University of California")
    expect(contributors.last.name).to eq("Microsoft Corp")
    expect(contributors.first.legislator).to eq(legislator)
    expect(contributors.last.legislator).to eq(legislator)
  end
end
