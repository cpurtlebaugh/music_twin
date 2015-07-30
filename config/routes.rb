Rails.application.routes.draw do

  root 'static_pages#welcome'

  get 'home'        => 'static_pages#home'

  get 'login'       => 'sessions#new'

  post 'login'      => 'sessions#create'

  delete 'logout'      => 'sessions#destroy'

  get 'signup'      => 'users#new'

  get 'about'       => 'static_pages#about'



  # post 'relationship' => 'users#add_twin'


  resources :users, only: [:index, :new, :create, :show]
  resources :twins do
    member do
      post "add"
    end
  end

end
