Rails.application.routes.draw do
  resources :invites
 #resources :user_groups 
  root to: "sessions#home"
  
  resources :groups 
  #resources :users
  resources :tasks



  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }  
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
