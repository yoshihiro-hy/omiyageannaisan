Rails.application.routes.draw do
  root to: 'staticpages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :rodgings, only: %i[new create index show destroy] do
    resources :shops, only: %i[new create show destroy] do
      collection do
        get 'search'
      end
    end
  end
end
