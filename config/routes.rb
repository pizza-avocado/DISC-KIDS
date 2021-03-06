Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
	  get "search_users" => "users#search",as: 'search_users'
    get "search_items" => "items#search", as:'search_items'
    resources :users,             only:[:index, :show, :edit, :update, :destroy] do
    resources :addresses,       only:[:new, :create, :show, :edit, :update, :destroy]
    resources :address_names,   only:[:new, :create ,:show, :edit, :update, :destroy]
    end
    resources :items,           only:[:new, :create, :edit, :update, :destroy, :show, :index] do
    resources :artists,       only:[:edit]
    resources :labels,        only:[:edit]
    resources :genres,        only:[:edit]
    end
    resources :artists,         except:[:edit]
    resources :labels,          except:[:edit]
    resources :genres,          except:[:edit]
    resources :items,           only:[:new, :create, :edit, :update, :destroy]
  	resources :inquiries,       only:[:index, :show]
  	resources :inquiry_replies, only:[:new, :create, :show]
  	resources :orders,          only:[:index, :show, :update]
 	  resources :reviews,         only:[:destroy]
  end

  get "search_users" => "items#search",as: 'search_users'
  get "search_items" => "items#search", as:'search_items'
	resources :users,           only:[:show, :edit, :update, :resign, :destroy]
  resources :items,           only:[:index, :show] do
  resource :likes,           only:[:create, :destroy]
  end
  resources :addresses,       only:[:new, :create, :show, :edit, :update, :destroy]
  resources :address_names,   only:[:new, :create ,:show, :edit, :update, :destroy]
  resources :carts,           only:[:create, :index, :destroy, :update]
  resources :inquiries,       only:[:new, :create]
  resources :orders,          only:[:new, :create, :show, :index]
 	resources :reviews,         only:[:new, :create, :edit, :update]

  get "user/resign" => "users#resign"
  delete "carts" => "carts#destroy"

  root "items#index"
end
