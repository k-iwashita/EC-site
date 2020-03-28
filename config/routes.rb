Rails.application.routes.draw do
  devise_for :end_users, controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
   }
   scope module: :public do
     root to: 'items#top'
     get 'end_users/withdraw', to: 'end_users#withdraw'
     resources :end_users, only: [:show, :edit, :update, :destroy]
     resources :items, only: [:index, :show]
     delete 'cart_items', to: 'cart_items#destroy_all'
     resources :cart_items, only: [:index, :create, :update, :destroy]
     post 'orders/confirm', to: 'orders#confirm'
     get 'orders/done', to: 'orders#done'
     resources :orders, only: [:new, :index, :show, :create]
     resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
   end
   namespace :admin do
     get 'top', to: 'top#top'
     resources :items
     resources :end_users, only: [:show, :edit, :index, :update]
     resources :genres, only: [:edit, :index, :create, :update]
     resources :orders, only: [:index, :show, :update]
     resources :order_details, only: [:update]
   end
   devise_for :admin, :controllers => {
     sessions: 'admin/sessions',
   }
end
