Rails.application.routes.draw do

  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :lists  #unsure of where to put this right now
  #resources :assignments use this so group members are ASSIGNED to  task

  resources :groups do
  resources :group_members do   #may need to nest invitations somehow for group invites?
      resources :tasks 
  end

    

 
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
