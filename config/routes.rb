Rails.application.routes.draw do
  resources :trips
  resources :parks
  resources :users
  get "/dashboard", to: "users#dashboard"
  post "/login", to: "auth#login"
  post "/signup", to: "auth#signup"
  patch '/likes', to: 'trips#updateLikes'
end
