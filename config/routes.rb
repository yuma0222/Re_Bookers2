Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/about' => 'home#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end