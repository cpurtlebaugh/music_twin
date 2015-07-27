Rails.application.routes.draw do
resources :users
resources :static_pages

root 'static_pages#home'
end
