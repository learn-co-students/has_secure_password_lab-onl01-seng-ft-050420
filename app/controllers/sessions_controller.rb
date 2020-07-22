class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:user][:name])
        # binding.pry
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id   
        else
            flash[:alert] = "We could not find a User with that name, please create an account"
        end
    end
end