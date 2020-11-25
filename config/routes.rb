Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :spots, only: [:index, :show] do
      resources :trips, only: [:create]
    end
    resources :trips, only: [:index, :show, :destroy]
end
