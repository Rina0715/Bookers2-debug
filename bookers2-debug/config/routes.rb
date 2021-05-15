Rails.application.routes.draw do
  get 'search/search'
  root to: 'homes#top'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:index, :create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/search' => 'search#search'


  get 'home/about' => 'homes#about'
end
