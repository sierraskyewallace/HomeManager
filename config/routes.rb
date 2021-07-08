Rails.application.routes.draw do
  resources :memberships
  resources :groups
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :lists do
    resources :tasks
  end
  
end
