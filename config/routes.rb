Rails.application.routes.draw do
  get 'homes/show'
  get 'users/index'
  get 'users/show'
  root to: 'homes#top'
  devise_for :users
  # #:controllers => {
  #   :sessions  => "users/sessions",
  #   :registrations => "users/registrations",
  #   :passwords => "users/passwords",
  # }
  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resources :homes, only: [:top, :show]
end
