Rails.application.routes.draw do
  resources :group_members
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" } 

  resources :groups do
    resources :invites, controller: 'invitation/invites', only: [:new, :create]
end

resources :lists do
resources :tasks
end

resources :notebooks do
  resources :notes
end
end
