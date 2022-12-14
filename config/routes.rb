Rails.application.routes.draw do
  root to: 'staticpages#top'
  get 'privacy_policy', to: 'staticpages#privacy_policy'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update]
  resources :rodgings, only: %i[index new create edit update destroy] do
    resources :shops, only: %i[index create destroy] do
      collection do
        get 'search'
        get 'directions'
      end
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
