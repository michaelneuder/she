Rails.application.routes.draw do
  get '/login', to: 'users#login'
  get '/signup', to: 'users#new'
  root 'static_pages#home'
  get "/about", to: 'static_pages#about'
end
