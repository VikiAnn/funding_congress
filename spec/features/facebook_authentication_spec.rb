require "rails_helper"
require "support/login"
include Login

def mock_invalid_authentication
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

describe "facebook login", type: :feature do
  it "can log in with facebook" do
    mock_auth_hash
    visit root_path

    find_link("Login").click

    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome, User Bob!")
  end

  it "can log out" do
    login

    find_link("Logout").click

    expect(page).to_not have_link("Logout")
    expect(page).to have_link("Login")
  end

  it "can't log in with invalid facebook credentials" do
    visit root_path
    mock_invalid_authentication

    find_link("Login").click

    expect(page).to have_link("Login")
    expect(page).to have_content("Your Facebook login info was incorrect. Please try again.")
  end

  it "creates a user when logging in" do
    login

    expect(User.all.count).to eq(1)
    expect(User.last.name).to eq("User Bob")
  end

  it "prompts a user to save a zipcode if the user hasn't already" do
    login

    expect(page).to have_link("Add a zipcode")
  end
end
