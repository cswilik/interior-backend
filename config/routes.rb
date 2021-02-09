Rails.application.routes.draw do
  resources :trips
  resources :parks
  resources :users
  post "/login", to: "auth#login"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
