Rails.application.routes.draw do
  resources :profiles
  resources :tweets
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "/test", to: "test#index"

  root 'test#index'
end