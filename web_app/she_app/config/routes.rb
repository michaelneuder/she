Rails.application.routes.draw do
  get 'welcome/index'

  get 'chat/get_message', to: 'chat#get_message'
  get 'chat/index'
  get 'chat/clev'
  post 'chat/index', to: 'chat#get_message'
  post 'chat/get_message', to: 'chat#print_response'

  get 'facebook/index'

  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get "/about", to: 'static_pages#about'
  resources :users
  post 'twilio/voice' => 'twilio#voice'

  get '/signed_up', to: 'static_pages#signed_up'
end
