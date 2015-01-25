class SunlightInfluenceExplorer
  include HTTParty
  base_uri "http://transparencydata.com/api/1.0"

  def initialize
    @apikey = Rails.application.secrets.sunlight_api_key
  end

  def top_contributors(legislator, cycle, limit = 5)
    entity_id = entity_id_lookup(legislator)
    if entity_id
      response = self.class.get("/aggregates/pol/#{entity_id}/contributors.json", query: {entity_id: entity_id, cycle: cycle, apikey: apikey, limit: limit})
      save_campaign_cycle(response, cycle)
    end
  end

  private

  attr_reader :apikey

  def entity_id_lookup(legislator)
    response = self.class.get("/entities/id_lookup.json", query: {bioguide_id: legislator.bioguide_id, apikey: apikey})
    if response.empty?
      response = self.class.get("/entities.json", query: {search: legislator.name, type: "politician", apikey: apikey})
    end
    response.first["id"]
  end

  def save_campaign_cycle(response, cycle)
    response.map do |raw_contributor_hash|
      raw_contributor_hash.merge("cycle" => cycle)
    end
  end
end
