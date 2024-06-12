Rails.application.routes.draw do
  get 'pages/Accueil', to: 'pages#Accueil'
  get 'pages/equipes', to: 'pages#equipes'
  get 'pages/contact', to: 'pages#contact'
  get 'pages/bienvenue', to: 'pages#bienvenue'
  get 'new', to: 'pages#new'

  get 'showAll', to: 'pages#showAll'

  get 'potins/:id', to: 'pages#show', as: 'potin'
  post 'potins', to: 'pages#create', as: 'create_potin'

 # Routes pour l'édition, la mise à jour et la suppression d'un potin
  get 'potins/:id/edit', to: 'pages#edit', as: 'edit_potin'
  patch 'potins/:id', to: 'pages#update', as: 'update_potin'
  delete 'potins/:id', to: 'pages#destroy', as: 'delete_potin'



  # Pour RESTful routes de potins
  resources :potins, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get 'signup', to: 'user#new'
  post 'signup', to: 'user#create'
  
  get 'login', to: 'user#login_form'
  post 'login', to: 'user#login'
  delete 'logout', to: 'user#destroy'
  get 'logout', to: 'user#destroy'
  get 'profile', to: 'user#profile'

  resources :users, only: [:new, :create]

  root 'pages#Accueil'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


