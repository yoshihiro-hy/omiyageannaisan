Rails.application.routes.draw do
  root to: 'staticpages#top'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :rodgings, only: %i[index new create show destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
end
