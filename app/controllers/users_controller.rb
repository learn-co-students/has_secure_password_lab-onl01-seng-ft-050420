class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render 'welcome/homepage'
    else
      flash[:error] = "That username is unavailable, please try again."
      redirect_to signup_path
    end
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end