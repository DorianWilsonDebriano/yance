Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations", confirmations: 'confirmations' }

  authenticated :user do
    get "/", to: "sports_classes#index"
  end

  root to: 'pages#home'
  get "/search", to: "pages#search", as: :search
  get "/profile", to: "pages#profile"
  get "/settings", to: "pages#settings"
  get "/become-a-trainer", to: "pages#trainer_info"
  get "/pricing", to: "pages#pricing", as: :pricing
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

  get '/success', to: 'subscriptions#success', as: :success


  resources :class_bookings, only: %i[edit update destroy]
  get "/stream", to: "classes#stream"

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  resources :sports_class_chatrooms, only: %i[index show update] do
    resources :sports_class_messages, only: :create
  end

  resources :customer_portal_sessions, only: [:create]

  resources :webhooks
  get 'webhooks/create'
end
