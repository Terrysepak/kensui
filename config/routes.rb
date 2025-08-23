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
  end
end
