Rails.application.routes.draw do
    resources :users
    post "/logout", to : "sessions#destroy"
    post "/login", to: "sessions#$create"
    post "/signup", to: "users#create"
    resources :posts, :only => [:create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
