class ContributorsParser
  attr_reader :data, :legislator_id

  def initialize(data, legislator_id)
    @data = data
    @legislator_id = legislator_id
  end

  def parse
    contributors = data.map do |contributor_data|
      Contributor.where(legislator_id: legislator_id, id: contributor_data[:id]).first_or_create.tap do |contributor|
        contributor.name            = contributor_data[:name]
        contributor.employee_amount = contributor_data[:employee_amount]
        contributor.total_amount    = contributor_data[:total_amount]
        contributor.direct_amount   = contributor_data[:direct_amount]
      end
    end
  end

  def self.parse(json, legislator_id)
    new(json, legislator_id).parse
  end
end
