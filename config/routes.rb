Rails.application.routes.draw do
  root to: 'team#index'

  get 'team/index'
end
