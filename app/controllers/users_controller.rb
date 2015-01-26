class UsersController < ApplicationController
  before_action :require_current_user, :set_user

  def show
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to legislators_path
    else
      flash[:notice] = "A zipcode should be 5 digits"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:zipcode, :email)
  end

  def require_current_user
    unless current_user.id == params["id"].to_i
      redirect_to root_path, notice: "You may only view your own information."
    end
  end

  def set_user
    @user = current_user
  end
end
