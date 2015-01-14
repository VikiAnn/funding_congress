require 'rails_helper'

RSpec.describe Contributor, :type => :model do
  it "belongs to a legislator" do
    contributor = create(:contributor)
    expect(contributor.legislator).to be_present
  end

  it "has a name" do
    contributor = create(:contributor)
    expect(contributor.name).to be_present
  end

  it "has a total" do
    contributor = create(:contributor)
    expect(contributor.total_amount).to be_present
    expect(contributor.total_amount.class).to eq BigDecimal
  end

  it "has a cycle" do
    contributor = create(:contributor)
    expect(contributor.cycle).to be_present
  end
end
