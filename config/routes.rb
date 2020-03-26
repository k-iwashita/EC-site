Rails.application.routes.draw do
  devise_for :end_users, controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
   }
   scope module: :public do
     resources :end_users, only: [:show, :edit, :withdraw, :update, :destroy]
     resources :items, only: [:index, :show]
     resources :cart_items, only: [:index, :create, :update, :destroy]
     delete 'cart_items', to: 'cart_items#destroy_all'
     root to: 'items#top'
   end
   namespace :admin do
     resources :items
     resources :end_users, only: [:show, :edit, :index, :update]
     resources :genres, only: [:edit, :index, :create, :update]
   end
   devise_for :admin, :controllers => {
     sessions: 'admin/sessions',
   }
end
