Rails.application.routes.draw do
 
  devise_for :users, path: "/", controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }
  devise_for :admins, path: "/admin", controllers: {
    sessions: 'admin/admins/sessions'
  }

  scope module: :public do
    root "home#top"
    resources :parks
    resources :users, only: [:show, :edit, :update, :destroy]
    post 'guest_login', to: 'users#guest_login'
  end

  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy]
  end
end
