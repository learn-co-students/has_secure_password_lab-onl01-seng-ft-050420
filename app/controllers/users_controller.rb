class UsersController < ApplicationController
  def new 
    @user = User.new
  end 
  
 
  def create
    @user = User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id
        redirect_to '/homepage'
      else
       redirect_to '/login'
      end
  end

  def welcome
    @user = User.find_by(name: params[:user][:params])
    "Hi #{@user.name}"
  end
   
  private
   
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
