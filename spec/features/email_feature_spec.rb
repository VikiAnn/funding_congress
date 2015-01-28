require 'rails_helper'

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

describe "user email feature", type: :feature do
  it "receives a welcome email on sign-up" do
    visit root_path
    mock_auth_hash

    expect(UserMailer).to receive(:welcome).and_return(double("mailer", deliver_now: nil))
    find_link("Login").click
  end
end
