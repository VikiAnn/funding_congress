module Login
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

  def login
    mock_auth_hash
    visit root_path
    find_link("Login").click
  end
end
