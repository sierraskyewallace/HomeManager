Rails.application.routes.draw do
 
  
  resources :group_memberships
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :groups do 
    resources :invites, controller: 'invitation/invites', only: [:new, :create]
    resources :tasks 
  end


    #resources :tasks 
    

  
end
