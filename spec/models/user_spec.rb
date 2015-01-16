require 'rails_helper'

RSpec.describe User, :type => :model do
  it "can be found or created from an oauth hash" do
    auth_data = { "provider" => "facebook",
      "uid" => "0123456789101112",
      "info" =>
        { "email" => "user@example.com",
          "name" => "User Bob",
          "first_name" => "User",
          "last_name" => "Bob" },
          "image" => "http://graph.facebook.com/0123456789101112/picture",
      "credentials" =>
        { "token"=> "apiufbgPIUABERPIUBGiaubgpiaerubpiUBAPRIUBGiubpfiegbuPISUBEriubsa" } }
    user = User.find_or_create_by_auth(auth_data)
    expect(user.name).to eq auth_data["info"]["name"]
    expect(user.email).to eq auth_data["info"]["email"]
    expect(user.uid).to eq auth_data["uid"]
    expect(user.token).to eq auth_data["credentials"]["token"]
  end
end
