class ContributorsFetcher
  attr_reader :legislator, :bioguide_id, :cycle, :legislator_name

  def initialize(legislator, cycle)
    @legislator = legislator
    @cycle = cycle
  end

  def self.fetch(legislator, cycle)
    new(legislator, cycle).fetch
  end

  def fetch
    raw_contributors = SunlightInfluenceExplorer.new.top_contributors(legislator, cycle)
    if raw_contributors
      ContributorsIngester.ingest(raw_contributors, legislator)
    end
  end
end
