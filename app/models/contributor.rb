class Contributor < ActiveRecord::Base
  belongs_to :legislator
  validates :legislator, presence: true

  def self.cycle(legislator, year)
    if _database_contributors(legislator, year).empty?
      ContributorsFetcher.fetch(legislator, year)
    else
      _database_contributors(legislator, year)
    end
  end

  def self._database_contributors(legislator, year)
    where(legislator: legislator).where(cycle: year)
  end
end
