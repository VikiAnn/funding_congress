require 'rails_helper'

describe LegislatorsFetcher do
  it "asks SunlightCongress for legislators and calls ingest on LegislatorsIngester" do
    sunlight_congress    = class_double("SunlightCongress").as_stubbed_const
    legislators_ingester = class_double("LegislatorsIngester").as_stubbed_const

    expect(sunlight_congress).to receive(:legislators).with("80203")
    expect(legislators_ingester).to receive(:ingest)

    LegislatorsFetcher.fetch("80203")
  end
end
