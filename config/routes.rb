Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'users#profile', as: :user_profile
  resources :service_nannies do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
