Rails.application.routes.draw do
  resources :assignments
  resources :lists
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }  


    resources :invites, controller: 'invitation/invites', only: [:new, :create]
    resources :tasks

 
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
