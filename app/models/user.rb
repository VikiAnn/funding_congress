class User < ActiveRecord::Base
  validates :zipcode, format: { with: /\A\d{5}\z/, message: "must be 5 digits" }, if: :zipcode?

  def update_from_omniauth(auth_data)
    send_welcome_email_if_new_user(auth_data)
    self.email      = auth_data["info"]["email"]
    self.name       = auth_data["info"]["name"]
    self.image_url  = auth_data["info"]["image"]
    self.token      = auth_data["credentials"]["token"]
    self.provider   = auth_data["provider"]
  end

  def send_welcome_email_if_new_user(auth_data)
    unless email && name
      UserWelcomeEmailJob.new.async.perform(user_name: auth_data["info"]["name"], email: auth_data["info"]["email"], uid: uid)
    end
  end
end
