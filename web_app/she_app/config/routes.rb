Rails.application.routes.draw do
  get 'chat/index'
  # get '/messageSubmitted.rb'

  get 'welcome/index'


  # root 'chat#index'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get "/about", to: 'static_pages#about'
  # get "/chat", to: 'chat/index'
  resources :users
end
