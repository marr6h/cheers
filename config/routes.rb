Rails.application.routes.draw do
  # get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :posts
  get '/following', to: 'home#following'
  get 'users/search', to: 'users#search'
  post 'users/search', to: 'users#search'
  get '/:username', to: 'home#user'
  get '/api/users/search', to: 'users#user_search'
  get '/api/users/follow', to: 'users#follow'
  get '/api/users/unfollow', to: 'users#unfollow'
  post '/entries', to: 'entries#create'
  post '/entries/:id', to: 'entries#update'
end
