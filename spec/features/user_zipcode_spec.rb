require 'rails_helper'
require "support/login"
include Login

describe "user profile" do
  it "can add/update a zipcode" do
    login
    user = User.last

    visit user_path(user)
    fill_in "zipcode", with: "80203"
    find_button("Update Zip").click

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("80203")
  end

  it "cannot be edited by other users" do
    other_user = User.create!
    login
    user = User.last

    visit user_path(other_user)
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You have to log in")
  end
end
