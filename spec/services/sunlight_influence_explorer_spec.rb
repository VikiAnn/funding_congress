require 'rails_helper'

describe "sunlight influence explorer" do
  it "can retrieve a legislator's top x contributors for a given cycle year using their entity_id" do
    legislator = create(:legislator, first_name: "Diana", last_name: "DeGette", bioguide_id: "D000197")
    VCR.use_cassette 'service/sunlight_influence_explorer_top_contributors'do
      response = SunlightInfluenceExplorer.top_contributors(legislator, "2012", 1)

      expect(response.first["name"]).to eq("Democracy Engine")
      expect(response.all? { |response| response["cycle"] == "2012" })
    end
  end

  it "uses the legislator's name to search for their entity_id if the bioguide_id lookup failed" do
    legislator = create(:legislator, first_name: "Ken", last_name: "Buck", bioguide_id: "B001297")
    VCR.use_cassette 'service/sunlight_influence_explorer_failed_entity_id_search' do
      response = SunlightInfluenceExplorer.top_contributors(legislator, "2014", 1)

      expect(response.first["name"]).to eq("Morning Fresh Farms")
    end
  end
end
