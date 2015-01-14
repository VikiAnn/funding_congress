class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to legislators_path, notice: "Welcome, #{@user.name}"
  end
end
