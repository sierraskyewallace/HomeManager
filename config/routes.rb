Rails.application.routes.draw do
  
  root to: "sessions#home"

  resources :groups do 
    resources :invites, controller: 'invitation/invites', only: [:new, :create]
      end
 
  resources :groups do 
    resources :tasks
  end

  



  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }  do 
    get 'account'  => 'users/registrations#edit', as: 'edit_user_registration'
    put 'account/:id' => 'users/registrations#update', as: 'update_user_registration'
  end 
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
