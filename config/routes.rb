Rails.application.routes.draw do
  # get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :posts
  get 'users/search', to: 'users#search'
  post 'users/search', to: 'users#search'
end
