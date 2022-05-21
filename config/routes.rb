Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'users#profile', as: :user_profile
  get 'showservice', to: 'users#showservice'
  get 'showbooking/:id', to: 'bookings#show'
  # post 'new/:id', to: 'bookings#new', as: :new_id
  resources :service_nannies do
    member do
      post 'calculate'
    end
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
