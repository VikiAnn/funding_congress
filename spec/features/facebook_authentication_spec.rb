require "rails_helper"

def mock_auth_hash
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({ "provider" => "facebook",
    "uid" => "0123456789101112",
    "info" =>
    { "email" => "user@example.com",
      "name" => "User Bob",
      "first_name" => "User",
      "last_name" => "Bob" },
      "image" => "http://graph.facebook.com/0123456789101112/picture",
      "credentials" =>
      { "token"=> "apiufbgPIUABERPIUBGiaubgpiaerubpiUBAPRIUBGiubpfiegbuPISUBEriubsa" } })
end

def mock_invalid_authentication
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

def login
  mock_auth_hash
  visit root_path
  find_link("Login").click
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
  end
end
