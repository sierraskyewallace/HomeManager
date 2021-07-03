Rails.application.routes.draw do
  
  root to: "sessions#home"

  resources :groups do
    resources :group_members
  end
  
  
  resources :tasks #move under users?

  



  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }  
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
