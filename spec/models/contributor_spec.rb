require 'rails_helper'

RSpec.describe Contributor, :type => :model do
  it "must have a legislator" do
    invalid_contributor = Contributor.new
    valid_contributor = Contributor.new(legislator: create(:legislator))

    expect(invalid_contributor).not_to be_valid
    expect(valid_contributor).to be_valid
  end

  context "cycle scope" do
    it "should return only records for the specified cycle year" do
      contributor1 = create(:contributor, cycle: "2014")
      contributor2 = create(:contributor, cycle: "2012")

      expect(Contributor.cycle("2014")).to eq [contributor1]
      expect(Contributor.cycle("2012")).to eq [contributor2]
    end
  end
end
