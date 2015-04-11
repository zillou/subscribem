Subscribem::Engine.routes.draw do
  root 'dashboard#index'
  get '/signup', to: 'accounts#new', as: :sign_up
  resources :accounts, only: [:create]
end
