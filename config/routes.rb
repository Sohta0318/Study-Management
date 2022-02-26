Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :works
  get 'graph', to: 'works#graph'
  get 'messages', to: 'messages#index'
  post 'messages', to: 'messages#create'
  resources :members
  get 'friends', to: 'members#friends'
  get 'graph/:id', to: 'members#graph', as: :test
end
