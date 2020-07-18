class UsersController < ApplicationController
    def show
        @user = User.find_by(id: session[:user_id])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/users/home'
        else
            redirect_to '/users/new'
        end
    end

private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end