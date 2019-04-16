Rails.application.routes.draw do
  
  get '/', to: "home#index", as: 'root'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/history', to: 'searches#index'

  resources :users, only: [:create]

end
