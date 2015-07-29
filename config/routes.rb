Rails.application.routes.draw do
  root              'static_pages#welcome'

  get 'home'        => 'static_pages#home'

  # get 'login'       => 'sessions#new'

  # get 'logout'      => 'sessions#destroy'

  # get 'signup'      => 'users#new'

  get 'about'       => 'static_pages#about'


resources :users, only: [:index, :new, :create]
resources :sessions, only: [:new, :create, :destroy]
resources :twins

end
