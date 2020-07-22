Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post :create, to: 'sessions#create'
  post :create, to: 'users#create'
  get '/signup', to: 'users#new', as: 'new'
end
