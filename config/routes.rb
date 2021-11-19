Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :profiles
  resources :followers
  resources :tweets
  devise_for :users, controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: redirect('/tweets')
  get "/test", to: "test#index"
  
  devise_scope :user do
    get "/users/profile/:id", to: "devise/registrations#show"
  end
  root 'test#index'
end
