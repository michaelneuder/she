Rails.application.routes.draw do
  root 'static_pages#home'
  get '/login', to: 'users#login'
  get '/signup', to: 'users#new'
  get "/about", to: 'static_pages#about'
  resources :users
end
