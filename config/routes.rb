Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#welcome"

  resources :users, only: [:new, :create, :show]
  
  get '/login', to: "users#login"
  post '/register', to: "users#new"
  get '/learnmore', to: "discover#index", as: 'discover'
end
