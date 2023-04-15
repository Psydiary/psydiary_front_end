Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#welcome"

  resources :users, only: [:new, :create, :show]
  
  get '/login', to: "users#login"
  get '/register', to: "users#new"
  get '/users/:id', to: "users#show"

  get '/users/:id/logs/new', to: "users/logs#new"
  post '/users/:id/logs', to: "users/logs#create"
  get '/users/:id/edit', to: "users#edit"
  patch '/users/:id', to: "users#update"
  get '/users/:id/logs', to: "users/logs#index"
  get '/users/:id/logs/:id', to: "users/logs#show"
  get '/users/:id/microdose_diarys', to: "users/microdose_diarys#index"
  get '/users/:id/microdose_diarys/new', to: "users/microdose_diarys#new"
  post '/users/:id/microdose_diarys', to: "users/microdose_diarys#create"

  get '/learn_more', to: "discover#index", as: 'discover'

  get '/protocols/new', to: "protocols#new"
  post '/protocols', to: "protocols#create"
  get '/protocols/:id', to: "protocols#show"
  get '/protocols/:id/edit', to: "protocols#edit"
  patch '/protocols/:id', to: "protocols#update"
end
