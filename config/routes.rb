Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # homesコントローラのルーティング
  
  root to:'homes#top'
  get '/about' => 'homes#about'
  
  # potsコントローラのルーティング
  
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  
end
