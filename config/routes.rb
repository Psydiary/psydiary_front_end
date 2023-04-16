Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#welcome"

  get '/login', to: "users#login"
  get '/register', to: "users#new"
  get '/learn_more', to: "discover#index", as: 'discover'

  resources :users, only: %i[show edit update] do
    resources :daily_log_entries, except: %i[edit destroy], controller: 'users/daily_log_entries'
    resources :microdose_diaries, only: %i[index new create], controller: 'users/microdose_diaries'
  end

  resources :protocols, except: %i[destroy]
end
