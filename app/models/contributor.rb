class Contributor < ActiveRecord::Base
  belongs_to :legislator
  validates :legislator, presence: true

  scope :cycle, -> (year) { where(cycle: year) }

  def self.cycles
    ["1990", "1992", "1994", "1996", "1998", "2000", "2002", "2004", "2006", "2008", "2010", "2012", "2014"]
  end
end
