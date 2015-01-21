require 'rails_helper'

describe "sunlight influence explorer" do
  it "can retrieve a legislator's entity_id using their bioguide_id" do
    VCR.use_cassette 'service/sunlight_influence_explorer_entity_id' do
      api = SunlightInfluenceExplorer.new
      response = api.id_lookup("D000197")

      expect(response.first["id"]).to eq("d34cf814990a4f8a9263686d7d08a437")
    end
  end

  it "can retrieve a legislator's top x contributors for a given cycle year using their entity_id" do
    VCR.use_cassette 'service/sunlight_influence_explorer_top_contributors'do
      api = SunlightInfluenceExplorer.new
      response = api.top_contributors("4148b26f6f1c437cb50ea9ca4699417a", "2012", 1)

      expect(response.first["name"]).to eq("University of California")
    end
  end
end
