require 'rails_helper'

describe "legislator listing page", type: :feature do
  it "lists all my legislators" do
    legislator1 = create(:legislator)
    legislator2 = create(:legislator)
    legislator3 = create(:legislator)

    visit legislators_path

    expect(page).to have_content(legislator1.full_name_and_title)
    expect(page).to have_content(legislator2.full_name_and_title)
    expect(page).to have_content(legislator3.full_name_and_title)
  end

  it "lists contributions for each legislator" do
    legislator1   = create(:legislator)
    legislator2   = create(:legislator)
    contributor1  = create(:contributor, legislator: legislator1)
    contributor2  = create(:contributor, legislator: legislator2)

    visit legislators_path

    within(".contributors_for_legislator_#{legislator1.id}") do
      expect(page).to have_content(contributor1.name)
    end
    within(".contributors_for_legislator_#{legislator2.id}") do
      expect(page).to have_content(contributor2.name)
    end
  end

  it "has social media links for each legislator" do
    legislator = create(:legislator)

    visit legislators_path

    expect(page).to have_css("a[href*='facebook.com']")
    expect(page).to have_css("a[href*='twitter.com']")
    expect(page).to have_css("a[href*='youtube.com']")
  end

  it "has a table for each legislator's contributors" do
    legislator = create(:legislator)
    contributor = create(:contributor, direct_amount: 800.00, employee_amount: 200.00, legislator: legislator)
    contributor2 = create(:contributor, direct_amount: 700.00, employee_amount: 300.00, legislator: legislator)

    visit legislators_path

    within(".contributors_for_legislator_#{legislator.id}") do
      expect(page).to have_content(contributor.name)
      expect(page).to have_content(contributor.total_amount.floor)
      expect(page).to have_content(contributor.employee_amount.floor)
      expect(page).to have_content(contributor.direct_amount.floor)
    end
  end

  it "shows 2014 cycle by default" do
    legislator = create(:legislator)
    contributor = create(:contributor, legislator: legislator, cycle: "2014")
    contributor2 = create(:contributor, legislator: legislator, cycle: "2012")

    visit legislators_path

    expect(page).to have_content(contributor.name)
    expect(page).not_to have_content(contributor2.name)
  end
end
