Rails.application.routes.draw do

  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :assignments

    resources :lists do 
      resources :tasks 
    end

    

 
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
