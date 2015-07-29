Rails.application.routes.draw do
  get 'twins/index'

  get 'sessions/new'

resources :users
resources :static_pages
resources :sessions
resources :twins

root 'static_pages#home'
end
