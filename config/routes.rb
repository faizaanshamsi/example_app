Rails.application.routes.draw do
  devise_for :users
  resources :items
  root "welcome#index"
end
