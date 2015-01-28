require "rails_helper"

RSpec.describe UserMailer, :type => :mailer, job: true do
  it "sends a welcome email" do
    user = create(:user, email: "viki@example.com", name: "Viki Ann")
    email_hash = { email: user.email, user_name: user.name, uid: user.uid }
    email = UserMailer.welcome(email_hash).deliver_now

    expect(ActionMailer::Base.deliveries).not_to be_empty
    expect(email.from[0]).to eq("victoria.harrod@gmail.com")
    expect(email.to[0]).to eq("viki@example.com")
    expect(email.subject).to eq("Welcome to FundingCongress.com")
    expect(email.body).to include("Viki Ann")
    expect(email.body).to have_link("add a zipcode to your profile")
  end
end
