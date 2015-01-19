class Contributor < ActiveRecord::Base
  belongs_to :legislator
  validates :legislator, presence: true

  scope :cycle, -> (year) { where(cycle: year) }
end
