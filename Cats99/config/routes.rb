Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests only: [:create, :destroy, :update, :new, :edit]
end
