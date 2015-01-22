class ContributorsFetcher
  attr_reader :legislator_id, :bioguide_id, :cycle

  def initialize(legislator_id, cycle)
    @legislator_id = legislator_id
    @cycle = cycle
    @bioguide_id = Legislator.find(legislator_id).bioguide_id
  end

  def self.fetch(legislator_id, cycle)
    new(legislator_id, cycle).fetch
  end

  def fetch
    raw_contributors = SunlightInfluenceExplorer.new.top_contributors(bioguide_id, cycle)
    ContributorsIngester.ingest(raw_contributors, legislator_id)
  end
end
