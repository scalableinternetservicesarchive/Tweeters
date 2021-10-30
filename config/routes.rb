Rails.application.routes.draw do
  devise_for :profiles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/test", to: "test#index"
  root 'test#index'
end
