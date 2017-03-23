Rails.application.routes.draw do
  root "home#index"

  get '/auth/github/callback', to: 'sessions#create'

  resources :dashboard, only: [:index]

  get '/logout', to: 'sessions#destroy'
  get '/followers', to: 'followers#index'
  get '/stars', to: 'stars#index'
  get '/following', to: 'followings#index'
  get '/organizations', to: 'organizations#index'
  get '/repositories', to: 'repositories#index'
end
