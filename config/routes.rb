Rails.application.routes.draw do
 
  
  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations' } 

  resources :groups 
  resources :groups, param: :invite_token, only: :show do 
    resources :group_memberships, only: [:new, :create]
    resource :invite_link, only: :show
    #resources :tasks 
  end

  #resources :group_memberships

    #resources :tasks 
    

  
end
