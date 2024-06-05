Rails.application.routes.draw do
  root "user#home"

  get "/home", to: "user#home"
  #user
  get "/show", to: "user#show"
  get "/signup", to: "user#new"
  post "/signup", to: "user#create"
  get "/edit_account", to: "user#edit_account"
  get "/edit_profile", to: "user#edit_profile"
  #session
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  #room
  get "/index_room", to: "room#index"
  #reservation
  get "/index_reservation", to: "reservation#index"

  # resources :users
  # resources :rooms
  # resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
