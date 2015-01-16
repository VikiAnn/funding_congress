require 'rails_helper'

RSpec.describe Legislator, type: :model do
  it { should have_many(:contributors) }

  it "can display a full name with title" do
    legislator = create(:legislator, first_name: "Sarah", last_name: "Silver", title: "Sen", party: "D")
    expect(legislator.full_name_and_title).to eq "Sen Sarah Silver, D"
  end

  it "has urls to social media" do
    legislator = create(:legislator, facebook_id: "123456", twitter_id: "somebody", youtube_id: "somebody")

    expect(legislator.facebook_url).to eq ("https://www.facebook.com/#{legislator.facebook_id}")
    expect(legislator.twitter_url).to eq ("https://twitter.com/#{legislator.twitter_id}")
    expect(legislator.youtube_url).to eq ("https://www.youtube.com/#{legislator.youtube_id}")
  end
end
