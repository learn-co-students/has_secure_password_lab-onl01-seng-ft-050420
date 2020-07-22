class UsersController < ApplicationController
  def create
    if user_params[:password] === user_params[:password_confirmation]
      user = User.create user_params
      session[:user_id] = user.try(:login, user_params[:password])
    else
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
