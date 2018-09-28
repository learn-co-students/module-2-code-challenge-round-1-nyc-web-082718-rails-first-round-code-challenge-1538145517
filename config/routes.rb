Rails.application.routes.draw do
  resources :powers, only: %i(index show)
  resources :heroines
end
