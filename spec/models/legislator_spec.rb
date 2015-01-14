require 'rails_helper'

RSpec.describe Legislator, :type => :model do
  let!(:legislator) { create(:legislator) }
  it "has a name" do
    expect(legislator.first_name).to be_present
    expect(legislator.last_name).to be_present
    expect(legislator.middle_name).to be_present
    expect(legislator.nickname).to be_present
  end

  it "can display a full name with title" do
    legislator = create(:legislator, first_name: "Sarah", last_name: "Silver", title: "Sen", party: "D")
    expect(legislator.full_name_and_title).to eq "Sen Sarah Silver, D"
  end

  it "has a bioguide id" do
    expect(legislator.bioguide_id).to be_present
    expect(legislator.bioguide_id.length).to eq (7)
  end

  it "knows if it is in office" do
    expect(legislator.in_office?).to eq true
  end

  it "knows its party" do
    legislator.party = "D"
    legislator.save
    expect(legislator.party).to eq "D"
  end

  it "has a gender" do
    expect(legislator.gender).to be_present
  end

  it "has a state" do
    expect(legislator.state).to be_present
    expect(legislator.state.length).to eq 2
  end

  it "has a title" do
    expect(legislator.title).to be_present
  end

  it "has a chamber" do
    expect(legislator.chamber).to be_present
  end
end
