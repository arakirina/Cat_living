Rails.application.routes.draw do

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories,only: [:index]
  resources :users, only: [:show]
  resources :posts do
    resource :favorites, only:[:create,:destroy]
    resources :post_comments, only: [:create,:destroy]
  end
  
  root to:'homes#top'
  get '/about' => 'homes#about'

end
