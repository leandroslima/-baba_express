Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  get '/users/:username', to: 'users#profile', as: :user_profile
  get 'showservice', to: 'user#showservice'
  get 'showboking/:id', to: 'bookings#show'
  resources :service_nannies do
    resources :bookings, only: [:new, :create, :show]
=======
  get '/users/:id', to: 'users#profile', as: :user_profile
  get 'showservice', to: 'users#showservice'
  get 'showbooking/:id', to: 'bookings#show'
  post 'new/:id', to: 'bookings#new', as: :new_id
  resources :service_nannies do
    member do
      post 'calculate'
    end
    resources :bookings, only: [:new, :create]
>>>>>>> master
  end
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
