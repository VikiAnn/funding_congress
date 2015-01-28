class UserMailer < ActionMailer::Base
  default from: 'victoria.harrod@gmail.com'

  def welcome(email_hash)
    @user_name = email_hash[:user_name]
    mail(to: email_hash[:email], subject: 'Welcome to FundingCongress.com')
  end
end
