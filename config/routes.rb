Rails.application.routes.draw do
  
  root to: "sessions#home"

  resources :groups do 
    resources :invites, controller: 'invitation/invites', only: [:new, :create]
      end
 
  resources :groups do 
    resources :tasks
  end

  



  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }  
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
