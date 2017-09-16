Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]

  resources :collaborators, only: [:new, :create, :destroy]

  get 'welcome/index'

  get 'about' => 'welcome#about'

  get 'users/new'

  get 'users/show'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
