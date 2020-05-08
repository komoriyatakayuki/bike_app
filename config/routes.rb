Rails.application.routes.draw do
  get 'users/show'

  root 'bikes#index'
  resources :bikes
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
