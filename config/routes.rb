Rails.application.routes.draw do
  root to: 'staticpages#top'

  resources :users, only: [:new, :create]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
end
