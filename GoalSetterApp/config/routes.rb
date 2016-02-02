Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :show, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, except: [:show]
end
