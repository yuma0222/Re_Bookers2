Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  root to: 'home#index'
  get 'home/about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
