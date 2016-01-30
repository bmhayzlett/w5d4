Rails.application.routes.draw do
  root "users#index"
  resources :users
  resource :session, only: [:new, :destroy, :create]
  resources :subs, except: [:destroy]
end
