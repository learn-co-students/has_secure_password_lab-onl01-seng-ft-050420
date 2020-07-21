class UsersController < ApplicationController

    def new 
        @user = User.new 
    end 
    
    def create 
        if params[:user][:name].present? && password_match
            @user = User.create(user_params)
            if @user.save
                session[:user_id] = @user.id   
                redirect_to root_path
            end
        else 
            redirect_to new_path 
        end
    end 

    private 

    def user_params 
        {name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation]}
    end 

    def password_match 
        params[:user][:password] == params[:user][:password_confirmation]
    end 


end
