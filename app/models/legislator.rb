class Legislator < ActiveRecord::Base
  has_many :contributors

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
end
