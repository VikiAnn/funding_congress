class LegislatorsIngester
  attr_reader :raw_legislator_json

  def initialize(raw_legislator_json)
    @raw_legislator_json = raw_legislator_json
  end

  def ingest
    raw_legislator_json["results"].map do |legislator_data|
      find_or_create_legislators(legislator_data).tap do |legislator|
        update_and_save_legislators(legislator, legislator_data)
      end
    end
  end

  def self.ingest(raw_legislator_json)
    new(raw_legislator_json).ingest
  end

  private

  def find_or_create_legislators(legislator_data)
    Legislator.where(bioguide_id: legislator_data["bioguide_id"]).first_or_create
  end

  def update_and_save_legislators(legislator, legislator_data)
    legislator.in_office   = legislator_data["in_office"]
    legislator.party       = legislator_data["party"]
    legislator.first_name  = legislator_data["first_name"]
    legislator.last_name   = legislator_data["last_name"]
    legislator.middle_name = legislator_data["middle_name"]
    legislator.nickname    = legislator_data["nickname"]
    legislator.state       = legislator_data["state"]
    legislator.title       = legislator_data["title"]
    legislator.chamber     = legislator_data["chamber"]
    legislator.facebook_id = legislator_data["facebook_id"]
    legislator.twitter_id  = legislator_data["twitter_id"]
    legislator.youtube_id  = legislator_data["youtube_id"]
    legislator.phone       = legislator_data["phone"]
    legislator.office      = legislator_data["office"]
    legislator.website     = legislator_data["website"]
    legislator.save!
  end
end
