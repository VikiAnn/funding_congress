class SessionsController < ApplicationController
  def create
    if facebook_login_was_successful?
      @user = User.find_or_create_by(uid: request.env["omniauth.auth"]["uid"])
      @user.update_from_omniauth(request.env["omniauth.auth"])
      @user.save!
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
end
