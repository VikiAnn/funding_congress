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
end
