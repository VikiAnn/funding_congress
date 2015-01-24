class ContributorsFetcher
  attr_reader :legislator_id, :bioguide_id, :cycle, :legislator_name

  def initialize(legislator_id, cycle)
    @legislator_id = legislator_id
    @cycle = cycle
    @bioguide_id = Legislator.find(legislator_id).bioguide_id
    @legislator_name = Legislator.find(legislator_id).name
  end

  def self.fetch(legislator_id, cycle)
    new(legislator_id, cycle).fetch
  end

  def fetch
    raw_contributors = SunlightInfluenceExplorer.new.top_contributors(legislator_name, bioguide_id, cycle)
    if raw_contributors
      ContributorsIngester.ingest(raw_contributors, legislator_id)
    end
  end
end
