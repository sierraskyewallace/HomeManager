Rails.application.routes.draw do
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'groups/invitations' } 

resources :lists do
resources :tasks
end



end
