class SessionsController < ApplicationController
  def create
    if request.env["omniauth.auth"]
      @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
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
end
