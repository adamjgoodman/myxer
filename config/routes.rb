Rails.application.routes.draw do
  devise_for :users
  root "myxes#index"
  resources :myxes
  resources :users do
    resource  :profile
  end
  resources :profile
end
