class WelcomeController < ApplicationController

    def home
        if session[:user_id].blank?
            redirect_to login_path
        end
    end 
end
