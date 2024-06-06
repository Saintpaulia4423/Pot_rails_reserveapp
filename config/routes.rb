Rails.application.routes.draw do
  root "user#home"

  get "/home", to: "user#home"
  #user
  get "/show/:id", to: "user#show", as: :show
  get "/signup", to: "user#new"
  post "/signup", to: "user#create"
  get "/edit_account/:id", to: "user#edit_account", as: :edit_account
  post "/edit_account/:id", to: "user#update"
  get "/edit_profile/:id", to: "user#edit_profile", as: :edit_profile
  post "/edit_profile/:id", to: "user#update"
  #session
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout/:id", to: "session#destroy", as: :logout
  #room
  get "/room/:id/index", to: "room#index_myrooms", as: :index_myroom
  get "/room/:id/new",to: "room#new", as: :new_room
  post "/room/:id/new", to: "room#create"
  get "/index_room", to: "room#index"
  #reservation
  get "/index_reservation", to: "reservation#index"

  # resources :users
  # resources :rooms
  # resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
