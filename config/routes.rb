Rails.application.routes.draw do
  root to: 'team#index'

  resources :team, only: [:index] do
    post 'fetch', on: :collection
  end
end
