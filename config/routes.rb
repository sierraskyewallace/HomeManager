Rails.application.routes.draw do
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'groups/invitations' } 

  resources :groups do
  resources :invites 
end

resources :lists do
resources :tasks
end

resources :notebooks do
  resources :notes
end
end
