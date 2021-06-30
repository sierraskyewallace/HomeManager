Rails.application.routes.draw do
  root to: "sessions#home"

  resources :invites, controller: 'invitation/invites', only: [:new, :create]
  
  
  resources :groups 

  resources :tasks



  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }  
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
