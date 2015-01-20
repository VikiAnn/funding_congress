class SunlightCongress
  attr_reader :apikey
  include HTTParty
  base_uri "https://congress.api.sunlightfoundation.com"

  def initialize
    @apikey = Rails.application.secrets.sunlight_api_key
  end

  def legislators(zip)
    self.class.get("/legislators/locate", query: {zip: zip, apikey: apikey})
  end
end