require 'rails_helper'

describe "sunlight influence explorer" do
  it "can retrieve a legislator's top x contributors for a given cycle year using their entity_id" do
    VCR.use_cassette 'service/sunlight_influence_explorer_top_contributors'do
      api = SunlightInfluenceExplorer.new
      response = api.top_contributors("D000197", "2012", 1)

      expect(response.first["name"]).to eq("Democracy Engine")
      expect(response.all? { |response| response["cycle"] == "2012" })
    end
  end
end
