Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:'homes#top'
  get '/about' => 'homes#about'

  resources :categories,only: [:index]
  resources :users, only: [:show ,:edit]
  resources :posts do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    get :search, on: :collection
  end

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

end
