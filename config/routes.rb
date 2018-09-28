Rails.application.routes.draw do
  resources :powers
  resources :heroines
  get '/', to: 'application#index'
end
