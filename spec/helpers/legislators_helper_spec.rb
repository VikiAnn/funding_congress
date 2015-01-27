require 'rails_helper'

describe LegislatorsHelper do
  describe "#active" do
    it "changes tab class to active when cycle is equal to current selected year" do
      expect(active("2014", "2014")).to eq("class=active")
    end
  end
end
