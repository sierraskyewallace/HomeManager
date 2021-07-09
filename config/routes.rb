Rails.application.routes.draw do
 
  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :groups do 
    resources :memberships
  end


    resources :tasks 

    get 'user_tasks/most_tasks' => 'user_tasks#index' 

    

  
end
