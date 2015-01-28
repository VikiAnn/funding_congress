class UserWelcomeEmailJob
  include SuckerPunch::Job

  def perform(email_data)
    UserMailer.welcome(email_data).deliver_now
  end
end
