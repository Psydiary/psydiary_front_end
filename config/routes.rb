Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#welcome"

  get '/login', to: "users#login"
  get '/register', to: "users#new"
  get '/users/:id', to: "users#show"

  get '/learn_more', to: "discover#index", as: 'discover'

  get '/protocols/new', to: "protocols#new"
  post '/protocols', to: "protocols#create"
  get '/protocols/:id', to: "protocols#show"
  get '/protocols/:id/edit', to: "protocols#edit"
  patch '/protocols/:id', to: "protocols#update"
end
