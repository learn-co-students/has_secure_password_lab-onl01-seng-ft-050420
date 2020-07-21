class SessionsController < ApplicationController
    
    def new 

    end 

    # def create 
     
    #     if @user = User.find_by(name: params[:user][:name]) && @user.authenticate(params[:user][:password])
    #         session[:user_id] = @user.id
    #         redirect_to root_path
    #     else 
    #         redirect_to root_path 
    #     end 
    # end 

    # def destroy 
    #     session.delete :user_id
    #     redirect_to root_path 
    # end 

  
  
    def create
      user = User.find_by(name: params[:user][:name])
  
      user = user.try(:authenticate, params[:user][:password])
  
      return redirect_to(controller: 'sessions', action: 'new') unless user
  
      session[:user_id] = user.id
  
      @user = user
  
      redirect_to controller: 'welcome', action: 'home'
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end

end
