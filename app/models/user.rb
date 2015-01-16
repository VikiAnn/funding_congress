class User < ActiveRecord::Base
  def self.find_or_create_by_auth(auth_data)
    user = find_or_create_by(uid: auth_data["uid"])

    user.email      = auth_data["info"]["email"]
    user.name       = auth_data["info"]["name"]
    user.image_url  = auth_data["info"]["image"]
    user.token      = auth_data["credentials"]["token"]
    user.provider   = auth_data["provider"]
    user.save

    user
  end
end
