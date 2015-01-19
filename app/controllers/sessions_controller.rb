class SessionsController < ApplicationController
  def create
    if facebook_login_was_successful?
      @user = save_or_update_user(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to legislators_path, notice: "Welcome, #{@user.name}!"
    else
      redirect_to root_path, notice: "Your Facebook login info was incorrect. Please try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are now logged out"
  end

  private

  def facebook_login_was_successful?
    request.env["omniauth.auth"]
  end

  def save_or_update_user(omniauth_hash)
    user = User.find_or_create_by(uid: omniauth_hash["uid"])
    user.update_from_omniauth(omniauth_hash)
    user.save!
    user
  end
end
