class UsersController < ApplicationController
  before_action :require_current_user

  def show
    @user = current_user
  end

  def update
    user = current_user
    user.update!(user_params)
    redirect_to legislators_path
  end

  private

  def user_params
    params.require(:user).permit(:zipcode, :email)
  end

  def require_current_user
    unless current_user == User.find(params["id"])
      redirect_to root_path, notice: "You have to log in to do that!"
    end
  end
end
