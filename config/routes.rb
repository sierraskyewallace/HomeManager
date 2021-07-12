Rails.application.routes.draw do
 
  
  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions', registrations: 'users/registrations' } 

  #resources :groups 
  resources :groups, param: :invite_token do 
    resources :group_memberships, only: [:new, :create]
    resource :invite_link, only: :show
    #resources :tasks 
  end

  #resources :group_memberships

    #resources :tasks 
    

  
end
