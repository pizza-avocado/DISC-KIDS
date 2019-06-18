Rails.application.routes.draw do


  devise_for :admins, controllers:{
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :users, controllers:{
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
	  get "search" => "users#search",as: 'search'
	  resources :users,           only:[:index]
    resources :items,           only:[:new, :create, :edit, :update, :destroy, :show]
    resources :artists,         only:[:new, :create, :index, :edit, :update, :destroy]
    resources :labels,          only:[:new, :create, :index, :edit, :update, :destroy]
    resources :genres,          only:[:new, :create, :index, :edit, :update, :destroy]
    resources :items,           only:[:new, :create, :edit, :update, :destroy]
  	resources :inquiries,       only:[:index]
  	resources :inquiry_replies, only:[:new, :create, :show]
  	resources :orders,          only:[:index, :show, :update]
 	  resources :reviews,         only:[:destroy]
  end




  get "search" => "items#search",as: 'search'
  get "search_items" => "items#search", as:'search_items'
	resources :users,           only:[:show, :edit, :update, :resign, :destroy]
  resources :items,           only:[:index, :show]
  resources :addresses,       only:[:new, :create, :show, :edit, :update, :destroy]
  resources :address_names,   only:[:new, :create ,:show, :edit, :update, :destroy]
  resources :carts,           only:[:create, :index, :destroy, :update]
  resources :inquiries,       only:[:new, :create]
  resources :likes,           only:[:create, :destroy]
  resources :orders,          only:[:new, :create, :show, :index]
 	resources :reviews,         only:[:new, :create, :edit, :update]

  get "user/resign" => "users#resign"

  delete "carts" => "carts#destroy"

 	post "users" => "addresses#create"
 	post "users" => "address_names#create"

  root "items#index"

end
