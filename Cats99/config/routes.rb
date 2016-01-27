Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:create, :destroy, :update, :new, :edit] do
    member do
       get 'approve'
    end
    member do
      get 'deny'
    end
  end
end
