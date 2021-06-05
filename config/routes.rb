Rails.application.routes.draw do

  resources :user_lists
  resources :completed_tasks
  resources :lists
  resources :tasks
  root to: "sessions#home"
  #devise_for :users
  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }


  
  #atch '/auth/:provider/callback' => 'sessions#omniauth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
