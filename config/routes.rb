Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/signup' => 'sessions#new'
post '/signup' =>'sessions#create'

get '/login' => 'users#new'
post '/login' => 'users#create'

get '/homepage' => 'users#welcome'





 
end
