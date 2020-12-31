Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  authenticated :user do
    get "/", to: "sports_classes#index"
  end

  root to: 'pages#home'
  get "/search", to: "pages#search", as: :search
  get "/profile", to: "pages#profile"
  get "/settings", to: "pages#settings"
  get "sports_classes/:id/duplicate", to: "sports_classes#duplicate", as: :duplicate

   resources :trainers, only: %i[show new create] do
    resources :sports_classes, only: %i[new create]
    resources :reviews, only: %i[new create]
  end

  resources :sports_classes, only: %i[edit update destroy]
  resources :trainers, only: %i[edit update destroy]
  resources :reviews, only: %i[edit update destroy]

  resources :sports_classes, only: %i[index show] do
    resources :class_bookings, only: %i[show new create]
  end

  resources :memberships, only: %i[index show] do
    resources :subscriptions, only: %i[show new create]
  end

  resources :subscriptions, only: %i[edit update destroy]

  resources :class_bookings, only: %i[edit update destroy]
  get "/stream", to: "classes#stream"
end
