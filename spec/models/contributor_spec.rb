require 'rails_helper'

RSpec.describe Contributor, :type => :model do
  it { should belong_to(:legislator) }

  context "cycle scope" do
    it "should return only records for the specified cycle year" do
      contributor1 = create(:contributor, cycle: "2014")
      contributor2 = create(:contributor, cycle: "2012")

      expect(Contributor.cycle("2014")).to eq [contributor1]
      expect(Contributor.cycle("2012")).to eq [contributor2]
    end
  end
end
