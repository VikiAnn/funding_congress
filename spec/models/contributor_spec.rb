require 'rails_helper'

RSpec.describe Contributor, :type => :model do
  it "must have a legislator" do
    invalid_contributor = Contributor.new
    valid_contributor = Contributor.new(legislator: create(:legislator))

    expect(invalid_contributor).not_to be_valid
    expect(valid_contributor).to be_valid
  end

  context "cycle scope" do
    it "should return only records for the specified legislator and cycle year" do
      legislator   = create(:legislator)
      contributor1 = create(:contributor, cycle: "2014", legislator: legislator)
      contributor2 = create(:contributor, cycle: "2012", legislator: legislator)

      expect(Contributor.cycle(legislator.id, "2014")).to eq [contributor1]
      expect(Contributor.cycle(legislator.id, "2012")).to eq [contributor2]
    end
  end
end
