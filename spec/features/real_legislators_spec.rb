require 'rails_helper'
require "support/login"
include Login

describe "real legislators from the api", type: :feature do
  it "pulls up real legislators when a user with a zipcode is logged in" do
    VCR.use_cassette 'service/real_legislators' do
      login
      user = User.find_by(email: "user@example.com")
      find_link("Add a zipcode").click
      fill_in "Zipcode", with: "80203"
      find_button("Update").click
      find_link("My Legislators").click

      expect(current_path).to eq(legislators_path)
      expect(page).to have_content("Rep Diana DeGette, D")
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
end
