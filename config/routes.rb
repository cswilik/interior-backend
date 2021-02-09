Rails.application.routes.draw do
  resources :trips
  resources :parks
  resources :users
  post "/login", to: "auth#login"
  patch '/likes', to: 'trips#updateLikes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
