class Contributor < ActiveRecord::Base
  belongs_to :legislator

  scope :cycle, -> (year) { where(cycle: year) }
end
