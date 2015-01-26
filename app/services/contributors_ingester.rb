class ContributorsIngester
  attr_reader :raw_contributors_json, :legislator

  def initialize(raw_contributors_json, legislator)
    @raw_contributors_json = raw_contributors_json
    @legislator = legislator
  end

  def ingest
    raw_contributors_json.map do |contributor_hash|
      find_or_create_contributors(legislator, contributor_hash).tap do |contributor|
        update_and_save_contributors(contributor, contributor_hash)
      end
    end
  end

  def self.ingest(raw_contributors_json, legislator)
    new(raw_contributors_json, legislator).ingest
  end

  private

  def find_or_create_contributors(legislator, contributor_hash) 
    Contributor.where(legislator: legislator, name: contributor_hash["name"], cycle: contributor_hash["cycle"]).first_or_create
  end

  def update_and_save_contributors(contributor, contributor_hash)
    contributor.employee_amount = contributor_hash["employee_amount"]
    contributor.total_amount    = contributor_hash["total_amount"]
    contributor.direct_amount   = contributor_hash["direct_amount"]
    contributor.save!
  end
end
