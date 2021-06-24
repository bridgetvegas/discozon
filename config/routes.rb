Rails.application.routes.draw do
  get 'carts/show'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :products, only: [:show, :index]
  resource :cart, only: [:show] do
  put 'add/:product_id', to: 'carts#add', as: :add_to
  put 'remove/:product_id', to: 'carts#remove', as: :remove_from
end


  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
