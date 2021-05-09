Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:index, :create, :destroy]
  end
  resources :users do
  #   member do
  #     get :following, :followers
  #   end
  # end
  # resources :relationships, only: [:create, :destroy]
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  get 'home/about' => 'homes#about'
end
