Rails.application.routes.draw do
  resources :users, only: [:show, :index, :create, :update, :destroy] do
    resources :contacts, only: [:show, :index, :create, :update, :destroy]
  end
  resources :contact_shares, only: [:show, :index, :create, :update, :destroy]
end
