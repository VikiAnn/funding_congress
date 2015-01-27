require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  it "sends a welcome email" do
    email = UserMailer.welcome("viki@example.com").deliver_now

    expect(ActionMailer::Base.deliveries).not_to be_empty
    expect(email.from).to eq("no-reply@fundingcongress.com")
    expect(email.to).to eq("viki@example.com")
    expect(email.subject).to eq("Welcome to FundingCongress.com")
  end
end
