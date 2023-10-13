Rails.application.routes.draw do
  devise_for :users,controllers: {registrations: 'registrations'}
  root "projects#index"
  resources :projects do
  resources :bugs, except: [:edit, :update]
  end
  resources :bugs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
