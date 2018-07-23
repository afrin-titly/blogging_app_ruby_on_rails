Rails.application.routes.draw do
  get 'blog/new'
  get 'blog_controller/new'
  get 'sessions/new'
  get 'users/new'
  get 'static_pages/home'
  root 'static_pages#home'
  get '/signup', to:'users#new'
  # get '/login', to:'sessions#new'
  # post '/login', to:'sessions#create'
  # delete '/logout', to:'sessions#destroy'
  get '/login', to:'blogger_logins#new'
  post '/login', to:'blogger_logins#create'
  delete '/logout', to:'blogger_logins#destroy'

  # get '/blogs', to:'blogs#index'
  resources :users
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
