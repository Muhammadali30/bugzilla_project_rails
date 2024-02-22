Rails.application.routes.draw do
  devise_for :users
  root "address#index"
  resources :address
  resources :students
end
