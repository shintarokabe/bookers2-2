Rails.application.routes.draw do
  root to: 'homes#home'
  get 'home/about' , to: 'homes#about', as: "homes_about"
  devise_for :users
  # #:controllers => {
     #:sessions  => "users/sessions",
     #:registrations => "users/registrations",
  #   :passwords => "users/passwords",
  # }
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resources :homes, only: [:home, :about]
end
