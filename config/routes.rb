Rails.application.routes.draw do
  devise_for :users
  root "myxes#index"
  resources :myxes
end