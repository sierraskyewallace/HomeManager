Rails.application.routes.draw do
 
  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :groups do 
    resources :memberships
  end


    resources :tasks 
      
    match '/tasks/complete/:id' => 'tasks#complete', as: 'complete_task', via: :put
    match '/tasks/complete/:id' => 'tasks#incomplete', as: 'incomplete_task', via: :delete

  
end
