require 'rails_helper'

describe "sunlight congress" do
  it "can retrieve legislators by zipcode" do
    VCR.use_cassette 'service/sunlight_congress' do
      Timecop.freeze(Time.local("2015")) do
        api = SunlightCongress.new
        response = api.legislators("80203")

        expect(response["results"].first["last_name"]).to eq("Gardner")
        expect(response["results"].second["last_name"]).to eq("DeGette")
        expect(response["results"].last["last_name"]).to eq("Bennet")
      end
    end
  end
end
