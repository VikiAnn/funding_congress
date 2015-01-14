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

describe "facebook login", type: :feature do
  it "can log in with facebook" do
    visit root_path
    mock_auth_hash
    find_link("Login").click
    expect(page).to_not have_link("Login")
    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome, User Bob")
  end
end
