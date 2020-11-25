Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/search", to: "pages#search", as: :search
  get "/profile", to: "pages#profile"

   resources :trainers, only: %i[show new create] do
    resources :sports_classes, only: %i[new create]

  end
  resources :sports_classes, only: %i[edit update destroy]
  resources :reviews, only: %i[edit update destroy]

  resources :sports_classes, only: %i[index show] do
    resources :reviews, only: %i[new create]
    resources :class_bookings, only: %i[show new create destroy]

    resources :class_bookings, only: %i[show new create]

  end

  # delete "booking/:id", to: "class_bookings#destroy"

  resources :class_bookings, only: %i[edit update destroy]
  get "/stream", to: "classes#stream"
end
