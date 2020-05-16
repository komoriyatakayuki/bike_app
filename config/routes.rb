Rails.application.routes.draw do


  root to: "home#index"
  devise_for :customers
  resources :customers
  resources :bikes

  
  resources :customers, only: [:index, :show]
  resources :bikes, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
    resources :reviews
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
