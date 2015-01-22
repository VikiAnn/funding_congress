class Contributor < ActiveRecord::Base
  belongs_to :legislator
  validates :legislator, presence: true

  def self.cycle(legislator_id, year)
    if _database_contributors(legislator_id, year).empty?
      ContributorsFetcher.fetch(legislator_id, year)
    else
      _database_contributors(legislator_id, year)
    end
  end

  def self._database_contributors(legislator_id, year)
    where(legislator_id: legislator_id).where(cycle: year)
  end
end
