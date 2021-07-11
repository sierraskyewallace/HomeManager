Rails.application.routes.draw do
 
  
  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" } 

  resources :groups do 
    resources :invites, controller: 'invitation/invites', only: [:new, :create]
    resources :tasks 
  end

  #resources :group_memberships

    #resources :tasks 
    

  
end
