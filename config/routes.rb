Rails.application.routes.draw do
 
  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :groups do 
    resources :memberships
  end

  resources :lists do
    resources :tasks
  end
  
end
