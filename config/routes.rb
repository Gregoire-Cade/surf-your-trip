Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spots, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
    resources :trips, only: [:create]
  end
 
  resources :trips, only: [:index, :show, :destroy]

end
