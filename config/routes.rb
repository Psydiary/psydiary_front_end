Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "welcome#welcome"

  get '/login', to: "users#login"
  get '/register', to: "users#new"
  get '/learn_more', to: "discover#index", as: 'discover'

<<<<<<< HEAD
  resources :users, only: %i[show update] do
    member do
      get 'settings', to: 'users#edit'
    end

=======
  resources :users, only: %i[create show edit update] do
>>>>>>> main
    resources :logs, except: %i[edit destroy], controller: 'users/logs'
    resources :microdose_diaries, only: %i[index new create], controller: 'users/microdose_diaries'
  end

  resources :protocols, except: %i[destroy]
end
