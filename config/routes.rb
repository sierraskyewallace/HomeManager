Rails.application.routes.draw do

  
  resources :tasks
  resources :groups do
    devise_for :users, :controllers => { invitations: 'users/invitations' }
end
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" }



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
