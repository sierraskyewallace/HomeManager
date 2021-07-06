Rails.application.routes.draw do
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'groups/invitations' } 

  resources :groups do
  resources :group_members    #may need to nest invitations somehow for group invites?
end

#resources :group_members  
resources :lists do
resources :tasks
end



end
