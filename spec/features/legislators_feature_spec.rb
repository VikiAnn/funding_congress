require 'rails_helper'

describe "legislator listing page", type: :feature do
  it "lists all my legislators" do
    legislator1   = create(:legislator)
    legislator2   = create(:legislator)
    contributor1  = create(:contributor, legislator: legislator1)
    contributor2  = create(:contributor, legislator: legislator2)
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    expect(page).to have_content(legislator1.full_name_and_title)
    expect(page).to have_content(legislator2.full_name_and_title)
  end

  it "lists contributions for each legislator" do
    legislator1   = create(:legislator)
    legislator2   = create(:legislator)
    contributor1  = create(:contributor, legislator: legislator1)
    contributor2  = create(:contributor, legislator: legislator2)
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    within(".contributors_for_legislator_#{legislator1.id}") do
      expect(page).to have_content(contributor1.name)
    end
    within(".contributors_for_legislator_#{legislator2.id}") do
      expect(page).to have_content(contributor2.name)
    end
  end

  it "only shows tabs for the years the legislator had contributors" do
    legislator   = create(:legislator)
    contributor1 = create(:contributor, legislator: legislator, cycle: "2010")
    contributor2 = create(:contributor, legislator: legislator, cycle: "2012")
    contributor3 = create(:contributor, legislator: legislator, cycle: "2014")
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    expect(page).to have_link("2010")
    expect(page).to have_link("2012")
    expect(page).to have_link("2014")
    expect(page).not_to have_link("2008")
  end

  it "has social media links for each legislator" do
    legislator   = create(:legislator)
    contributor  = create(:contributor, legislator: legislator)
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    expect(page).to have_css("a[href*='facebook.com']")
    expect(page).to have_css("a[href*='twitter.com']")
    expect(page).to have_css("a[href*='youtube.com']")
  end

  it "has contact info for each legislator" do
    legislator   = create(:legislator, phone: "888-888-88888", office: "123 Legislator Lane", website: "www.legislator.com")
    contributor  = create(:contributor, legislator: legislator)
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    expect(page).to have_content(legislator.phone)
    expect(page).to have_content(legislator.office)
    expect(page).to have_content(legislator.website)
  end

  it "has a table for each legislator's contributors" do
    legislator   = create(:legislator)
    contributor  = create(:contributor, direct_amount: 800.00, employee_amount: 200.00, legislator: legislator)
    contributor2 = create(:contributor, direct_amount: 700.00, employee_amount: 300.00, legislator: legislator)
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    within(".contributors_for_legislator_#{legislator.id}") do
      expect(page).to have_content(contributor.name)
      expect(page).to have_content(contributor.total_amount.floor)
      expect(page).to have_content(contributor.employee_amount.floor)
      expect(page).to have_content(contributor.direct_amount.floor)
    end
  end

  it "shows 2014 cycle by default" do
    legislator   = create(:legislator)
    contributor  = create(:contributor, legislator: legislator, cycle: "2014")
    contributor2 = create(:contributor, legislator: legislator, cycle: "2012")
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path

    expect(page).to have_content(contributor.name)
    expect(page).not_to have_content(contributor2.name)
  end

  it "shows scoped contributors by campaign cycle" do
    legislator   = create(:legislator)
    contributor  = create(:contributor, legislator: legislator, cycle: "2014")
    contributor2 = create(:contributor, legislator: legislator, cycle: "2012")
    sunlight_influence_explorer = class_double("SunlightInfluenceExplorer").as_stubbed_const
    allow(sunlight_influence_explorer).to receive(:top_contributors) { [] }

    visit legislators_path
    find_link("2012").click

    expect(page).to have_content(contributor2.name)
    expect(page).not_to have_content(contributor.name)
  end
end
