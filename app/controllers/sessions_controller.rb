class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        #binding.pry
        if @user.nil?
            redirect_to '/login'
        else
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/home'
        end
    end
end
