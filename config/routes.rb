Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :profiles
  resources :followers
  resources :tweets
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "/test", to: "test#index"

  root 'test#index'
end
