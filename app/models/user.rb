class User < ActiveRecord::Base
  def update_from_omniauth(auth_data)
    self.email      = auth_data["info"]["email"]
    self.name       = auth_data["info"]["name"]
    self.image_url  = auth_data["info"]["image"]
    self.token      = auth_data["credentials"]["token"]
    self.provider   = auth_data["provider"]
  end
end
