require 'rails_helper'
require "support/login"
include Login

describe "real contributors from api" do
  it "pulls up real contributors by cycle year" do
    VCR.use_cassette 'service/real_contributors' do
      login
      user = User.find_by(email: "user@example.com")
      find_link("Add a zipcode").click
      fill_in "Zipcode", with: "80203"
      find_button("Update Zip").click
      find_link("My Legislators").click

      expect(current_path).to eq(legislators_path)
      expect(page).to have_content("Democracy Engine")
    end
  end
end
