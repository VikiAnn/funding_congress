class LegislatorsFetcher
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def self.fetch(zipcode)
    new(zipcode).fetch
  end

  def fetch
    raw_legislators = SunlightCongress.new.legislators(zipcode)
    LegislatorsIngester.ingest(zipcode, raw_legislators)
  end
end
