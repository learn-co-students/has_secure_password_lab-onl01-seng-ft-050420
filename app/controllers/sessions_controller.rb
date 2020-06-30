class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to login_path, alert: "Wrong username or email."
    end
  end

end
