class ContributorsIngester
  attr_reader :raw_contributor_json, :legislator_id

  def initialize(raw_contributor_json, legislator_id)
    @raw_contributor_json = raw_contributor_json
    @legislator_id = legislator_id
  end

  def ingest
    raw_contributor_json.map do |contributor_data|
      find_or_create_contributors(legislator_id, contributor_data).tap do |contributor|
        update_and_save_contributors(contributor, contributor_data)
      end
    end
  end

  def self.ingest(raw_contributor_json, legislator_id)
    new(raw_contributor_json, legislator_id).ingest
  end

  private

  def find_or_create_contributors(legislator_id, contributor_data) 
    Contributor.where(legislator_id: legislator_id, sunlight_id: contributor_data[:id], cycle: contributor_data[:cycle]).first_or_create
  end

  def update_and_save_contributors(contributor, contributor_data)
    contributor.name            = contributor_data[:name]
    contributor.employee_amount = contributor_data[:employee_amount]
    contributor.total_amount    = contributor_data[:total_amount]
    contributor.direct_amount   = contributor_data[:direct_amount]
    contributor.save!
  end
end
