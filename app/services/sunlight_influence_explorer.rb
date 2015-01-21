class SunlightInfluenceExplorer
  attr_reader :apikey
  include HTTParty
  base_uri "http://transparencydata.com/api/1.0"

  def initialize
    @apikey = Rails.application.secrets.sunlight_api_key
  end

  def id_lookup(bioguide_id)
    self.class.get("/entities/id_lookup.json", query: {bioguide_id: bioguide_id, apikey: apikey})
  end

  def top_contributors(entity_id, cycle, limit = 5)
    self.class.get("/aggregates/pol/#{entity_id}/contributors.json", query: {entity_id: entity_id, cycle: cycle, apikey: apikey})
  end
end
