Rails.application.routes.draw do
  
  

  resources :users,           only:[:show, :edit, :update, :resign, :destroy, :index]
  resources :items,           only:[:index, :show, :new, :create, :edit, :update, :destroy]
  resources :addresses,       only:[:new, :create, :show, :update, :destroy]
  resources :address_names,   only:[:new, :create ,:show ,:update, :destroy]
  resources :carts,           only:[:create, :index, :destroy]
  resources :inquiries,       only:[:new, :create, :index]
  resources :inquiry_replies, only:[:new, :create, :show]
  resources :likes,           only:[:create, :destroy]
  resources :orders,          only:[:new, :create, :index, :show, :update]
  resources :reviews,         only:[:new, :create, :edit, :update, :destroy]

  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
