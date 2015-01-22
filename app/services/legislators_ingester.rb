class LegislatorsIngester
  attr_reader :zipcode, :raw_legislators_json

  def initialize(zipcode, raw_legislators_json)
    @zipcode = zipcode
    @raw_legislators_json = raw_legislators_json
  end

  def ingest
    raw_legislators_json["results"].map do |legislator_hash|
      find_or_create_legislators(legislator_hash).tap do |legislator|
        update_and_save_legislators(legislator, legislator_hash)
      end
    end
  end

  def self.ingest(zipcode, raw_legislators_json)
    new(zipcode, raw_legislators_json).ingest
  end

  private

  def find_or_create_legislators(legislator_hash)
    legislator = Legislator.where(bioguide_id: legislator_hash["bioguide_id"], zipcode: zipcode).first_or_create
  end

  def update_and_save_legislators(legislator, legislator_hash)
    legislator.in_office   = legislator_hash["in_office"]
    legislator.party       = legislator_hash["party"]
    legislator.first_name  = legislator_hash["first_name"]
    legislator.last_name   = legislator_hash["last_name"]
    legislator.middle_name = legislator_hash["middle_name"]
    legislator.nickname    = legislator_hash["nickname"]
    legislator.state       = legislator_hash["state"]
    legislator.title       = legislator_hash["title"]
    legislator.chamber     = legislator_hash["chamber"]
    legislator.facebook_id = legislator_hash["facebook_id"]
    legislator.twitter_id  = legislator_hash["twitter_id"]
    legislator.youtube_id  = legislator_hash["youtube_id"]
    legislator.phone       = legislator_hash["phone"]
    legislator.office      = legislator_hash["office"]
    legislator.website     = legislator_hash["website"]
    legislator.save!
  end
end
