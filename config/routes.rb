Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories,only: [:show]
  
  root to:'homes#top'
  get '/about' => 'homes#about'

  resources :posts
  resources :users, only: [:show]

end
