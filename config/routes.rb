Rails.application.routes.draw do

  scope module: :public do
    devise_for :end_users
  end

  namespace :admin do
    devise_for :admins,
    path: :'',
    :controllers => {    
      :sessions => 'admin/sessions',
    }
  end
end
