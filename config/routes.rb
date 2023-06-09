Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "welcome#welcome"

  get '/login', to: "users#login_form"
  post '/login', to: "users#login"
  delete '/login', to: "users#logout"

  get '/register', to: "users#new"
  
  get '/auth/:provider/callback', to: "users#omniauth"

  resources :users, only: %i[create show edit update] do
    get 'settings', to: 'users#edit'
    patch 'settings', to: 'users#update'

    get 'log_entries', to: 'users#log_entries'

    resources :daily_log_entries, except: %i[edit destroy], controller: 'users/daily_log_entries'
    resources :microdose_log_entries, only: %i[index show new create], controller: 'users/microdose_log_entries'
    resources :protocols, except: %i[edit update destroy], controller: 'users/protocols'
    patch '/protocols/:id', to: 'users#update_protocol'
  end
end
