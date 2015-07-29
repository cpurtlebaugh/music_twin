Rails.application.routes.draw do
  root 'static_pages#welcome'

  get 'static_pages/home' => 'static_pages#home'

  post 'login' => 'sessions#new'

  get 'log_out' => 'sessions#destroy'

  get 'login' => 'sessions#'


resources :users
resources :static_pages
resources :sessions
resources :twins

end
