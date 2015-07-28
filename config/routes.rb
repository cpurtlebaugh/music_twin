Rails.application.routes.draw do
  get 'sessions/new'

resources :users
resources :static_pages
resources :sessions

root 'static_pages#home'
end
