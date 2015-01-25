require 'rails_helper'
require "support/login"
include Login

describe "real legislators from the api", type: :feature do
  it "pulls up real legislators with pictures when a user with a zipcode is logged in" do
    VCR.use_cassette 'service/real_legislators' do
      login
      user = User.find_by(email: "user@example.com")
      find_link("Add a zipcode").click
      fill_in "Zipcode", with: "80203"
      find_button("Update").click
      find_link("My Legislators").click

      expect(current_path).to eq(legislators_path)
      expect(page).to have_content("Rep Diana DeGette, D")
      expect(page).to have_css("img[src='http://theunitedstates.io/images/congress/225x275/D000197.jpg']")
    end
  end

  it "pulls up legislators from the database when the legislators already exist" do
    legislator =  create(:legislator, zipcode: "80203")
    contributor = create(:contributor, legislator: legislator)
    user = User.find_by(email: "user@example.com")
    login

    find_link("Add a zipcode").click
    fill_in "Zipcode", with: "80203"
    find_button("Update").click
    visit legislators_path

    expect(legislator.zipcode).to eq("80203")
    expect(current_path).to eq(legislators_path)
    expect(Legislator.count).to eq(1)
  end

  it "can look up legislators using the home page zipcode field" do
    legislator1 =  create(:legislator, first_name: "Sara", zipcode: "80203")
    contributor1 = create(:contributor, legislator: legislator1)
    legislator2 =  create(:legislator, first_name: "Jane", zipcode: "80203")
    contributor2 = create(:contributor, legislator: legislator2)
    legislator3 =  create(:legislator, first_name: "Anne", zipcode: "80003")
    contributor3 = create(:contributor, name: "Anne's Contributor", legislator: legislator3)

    visit root_path
    fill_in "zipcode", with: "80203"
    find_button("go").click
    
    expect(current_path).to eq(legislators_path)
    expect(page).to have_content(legislator1.full_name_and_title)
    expect(page).to have_content(legislator2.full_name_and_title)
    expect(page).not_to have_content(legislator3.full_name_and_title)
    expect(page).to have_content(contributor1.name)
    expect(page).to have_content(contributor2.name)
    expect(page).not_to have_content(contributor3.name)
  end
end
