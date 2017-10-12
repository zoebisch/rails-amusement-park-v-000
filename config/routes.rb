Rails.application.routes.draw do

  root 'users#index'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create', as: "users"
  get '/users/:id' => 'users#show', as: "users_show"
  post '/users/:id' => 'users#show'
  post '/users/:id/take_ride' => 'users#take_ride', as: "take_ride"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create', as: "sessions"
  delete 'logout' => 'sessions#destroy'
  patch '/attractions/:id' => 'attractions#patch'
  resources :attractions, :only => [:new, :create, :edit, :index, :show]
end
