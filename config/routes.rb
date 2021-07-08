Rails.application.routes.draw do
  

  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks" } 


  resources :groups 



resources :groups do
resources :tasks
end

resources :notebooks do
  resources :notes
end
end
