class Legislator < ActiveRecord::Base
  has_many :contributors

  def self.for_zipcode(zipcode)
    if _database_legislators(zipcode).empty?
      LegislatorsFetcher.fetch(zipcode)
    else
      _database_legislators(zipcode)
    end
  end

  def years_with_contributors
    Rails.cache.fetch("#{cache_key}_election_cycles") do
      election_cycles.select do |year|
        contributors.cycle(self, year).count > 0
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def full_name_and_title
    "#{title} #{first_name} #{last_name}, #{party}"
  end

  def facebook_url
    "https://www.facebook.com/#{facebook_id}"
  end

  def twitter_url
    "https://twitter.com/#{twitter_id}"
  end

  def youtube_url
    "https://www.youtube.com/#{youtube_id}"
  end

  def self._database_legislators(zipcode)
    where(zipcode: zipcode).where(in_office: true)
  end

  private

  def election_cycles
    (1990..Date.today.year).select {|year| year.even?}.map(&:to_s)
  end
end
