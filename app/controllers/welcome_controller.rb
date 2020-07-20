class WelcomeController < ApplicationController
  def homepage
    @user = User.find_by(name: params[:name])
  end
end