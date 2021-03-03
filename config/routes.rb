Rails.application.routes.draw do
  resources :trips
  resources :parks
  resources :users
  get "/dashboard", to: "users#dashboard"
  post "/login", to: "auth#login"
  post "/signup", to: "auth#signup"
  patch '/likes', to: 'trips#updateLikes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
