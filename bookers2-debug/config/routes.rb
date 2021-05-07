Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:index, :create, :destroy]
  end
  resources :users do
    resouce :relationship
  end

  get 'home/about' => 'homes#about'
end
