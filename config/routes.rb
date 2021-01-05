Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sites#index'
  resources :users, only: [:show, :edit, :update]
  resources :sites, only: [:index, :edit, :create, :update, :destroy] do
	  resource :likes, only: [:create, :destroy]
	end
	get 'likes/index'
end
