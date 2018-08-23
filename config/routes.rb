Rails.application.routes.draw do
  resources :users do
    resources :tweets do
      resources :comments, :likes
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/profile', to: 'users#profile', as: 'profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'
  get '/feed', to: 'users#feed', as: 'feed'

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
