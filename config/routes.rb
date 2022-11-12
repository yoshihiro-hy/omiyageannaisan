Rails.application.routes.draw do
  root to: 'staticpages#top'
  
  resource :users, only: [:new, :create]
end
