Rails.application.routes.draw do
  

  resources :user_lists
  resources :lists
  resources :tasks
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" } 


end
