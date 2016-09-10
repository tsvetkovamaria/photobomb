Rails.application.routes.draw do

  root 'photos#index'

  resources :photos

  devise_for :users 

  get 'user/:id', to: 'users#show', as: 'show_user'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
