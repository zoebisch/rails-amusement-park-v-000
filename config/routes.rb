Rails.application.routes.draw do

  root 'users#index'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create', as: "users"
  get '/users/:id' => 'users#show', as: "users_show"
  post '/users/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create', as: "sessions"
  delete 'logout' => 'sessions#destroy'
  resources :attractions, :only => [:index, :show]
end
