Rails.application.routes.draw do
  resources :applications
  resources :skills
  resources :poster_informations
  resources :freelancer_informations
  resources :posts
  resources :users
  
  # devise_for :users
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { sessions: 'users/sessions' }
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
    root to: "posts#index"

  
  match '/dashboard', to: 'users#dashboard', via: :get
  match '/profile', to: 'users#profile', via: :get


end
