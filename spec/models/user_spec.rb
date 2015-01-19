require 'rails_helper'

RSpec.describe User, :type => :model do
  it "can be updated from an oauth hash" do
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

    user = create(:user, uid: auth_data["uid"])
    user.update_from_omniauth(auth_data)
    user.save!
    user.reload

    expect(user.name).to eq auth_data["info"]["name"]
    expect(user.email).to eq auth_data["info"]["email"]
    expect(user.token).to eq auth_data["credentials"]["token"]
  end
end
