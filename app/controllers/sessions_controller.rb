class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render 'welcome/homepage'
    else
      flash[:error] = "Invalid credentials, please try again."
      redirect_to login_path
    end
  end
end