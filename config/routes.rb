Rails.application.routes.draw do
  devise_for :end_users, controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
   }
   scope module: :public do
     resources :end_users
   end
   namespace :admin do
     resources :items
   end
   devise_for :admin, :controllers => {
     sessions: 'admin/sessions',
   }
end
