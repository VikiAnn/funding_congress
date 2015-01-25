require 'rails_helper'

describe ContributorsFetcher do
  it "asks SunlightInfluenceExplorer for legislators and calls ingest on LegislatorsIngester" do
    legislator = create(:legislator)
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    contributors_ingester       = class_double("ContributorsIngester").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors).with(legislator, "2014").and_return({})

    expect(sunlight_influence_explorer).to receive(:top_contributors).with(legislator, "2014")
    expect(contributors_ingester).to receive(:ingest)

    ContributorsFetcher.fetch(legislator, "2014")
  end
end
