require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  it "sends a welcome email" do
    email_hash = { email: "viki@example.com", user_name: "Viki Ann" }
    email = UserMailer.welcome(email_hash).deliver_now

    expect(ActionMailer::Base.deliveries).not_to be_empty
    expect(email.from[0]).to eq("victoria.harrod@gmail.com")
    expect(email.to[0]).to eq("viki@example.com")
    expect(email.subject).to eq("Welcome to FundingCongress.com")
    expect(email.body).to include("Viki Ann")
  end
end
