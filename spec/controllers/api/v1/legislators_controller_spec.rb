require 'rails_helper'

RSpec.describe Api::V1::LegislatorsController, :type => :controller do
  it "returns json with legislators for a given zipcode" do
    4.times { create(:legislator, zipcode: "80203") }
    create(:legislator, zipcode: "33176")

    get(:index, { format: :json, zipcode: "80203" })

    expect(JSON.parse(response.body)["legislators"].count).to eq(4)
  end

  it "returns json with all existing legislators when not given a zipcode" do
    2.times { create(:legislator, zipcode: "80203") }
    2.times { create(:legislator, zipcode: "80202") }
    2.times { create(:legislator, zipcode: "80201") }

    get(:index, { format: :json })

    expect(JSON.parse(response.body)["legislators"].count).to eq(6)
  end

  it "returns contributors with legislators" do
    legislator = create(:legislator, zipcode: "80203")
    2.times { create(:contributor, legislator: legislator) }

    get(:index, { format: :json })

    expect(JSON.parse(response.body)["legislators"].count).to eq(1)
    expect(JSON.parse(response.body)["legislators"].first["campaign_contributors"].first.count).to eq(2)
  end

  it "returns a single legislator with its contributors" do
    legislator = create(:legislator)
    2.times { create(:contributor, legislator: legislator, cycle: "2014") }

    get(:show, { format: :json, id: legislator.id })

    expect(JSON.parse(response.body).count).to eq(1)
    expect(JSON.parse(response.body)["legislator"]["campaign_contributors"]["2014"].count).to eq(2)
  end
end
