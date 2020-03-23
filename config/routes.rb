Rails.application.routes.draw do

  get 'items/admin/items'
  scope module: :public do
    devise_for :end_users
    resources :end_users
  end

  namespace :admin do
    resources :items
    devise_for :admins,
    path: :'',
    :controllers => {    
      :sessions => 'admin/sessions',
    }
  end
end
