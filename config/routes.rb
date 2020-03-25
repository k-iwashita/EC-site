Rails.application.routes.draw do
  devise_for :end_users, controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
   }
   scope module: :public do
     resources :end_users, only: [:show, :edit, :withdraw, :update, :destroy]
     resources :items, only: [:index, :show]
     root to: 'items#top'
   end
   namespace :admin do
     resources :items
     resources :end_users, only: [:show, :edit, :index, :update]
   end
   devise_for :admin, :controllers => {
     sessions: 'admin/sessions',
   }
end
