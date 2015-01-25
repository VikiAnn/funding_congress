class SunlightCongress
  attr_reader :zip
  include HTTParty
  base_uri "https://congress.api.sunlightfoundation.com"

  def initialize(zip)
    @apikey = Rails.application.secrets.sunlight_api_key
    @zip = zip
  end

  def self.legislators(zip)
    new(zip).legislators
  end

  def legislators
    self.class.get("/legislators/locate", query: {zip: zip, apikey: apikey})
  end

  private

  attr_reader :apikey

end
