Rails.application.routes.draw do
  root              'static_pages#welcome'

  get 'home'        => 'static_pages#home'

  get 'login'      => 'sessions#new'

  get 'logout'     => 'sessions#destroy'

  get 'signup'     => 'users#new'


resources :users
resources :static_pages
resources :sessions
resources :twins

end
