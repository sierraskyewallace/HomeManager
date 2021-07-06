Rails.application.routes.draw do

  
  root to: "sessions#home"

  devise_for :users, :controllers => {omniauth_callbacks: "users/omniauth_callbacks", invitations: 'users/invitations' } 

  resources :lists  #unsure of where to put this right now
  #resources :assignments use this so group members are ASSIGNED to  task

  resources :groups do
  resources :group_members do   #may need to nest invitations somehow for group invites?
      resources :tasks 
  end
end

#group_group_members GET      /groups/:group_id/group_members(.:format)     group_members#index
#                    POST     /groups/:group_id/group_members(.:format)       group_members#create
#new_group_group_member GET      /groups/:group_id/group_members/new(.:format)      group_members#new
#edit_group_group_member GET      /groups/:group_id/group_members/:id/edit(.:format)       group_members#edit
#group_group_member GET      /groups/:group_id/group_members/:id(.:format)   group_members#show


#                  PATCH    /groups/:group_id/group_members/:id(.:format)      group_members#update
#                    PUT      /groups/:group_id/group_members/:id(.:format)      group_members#update
#                    DELETE   /groups/:group_id/group_members/:id(.:format)  group_members#destroy
#                    
# groups             GET      /groups(.:format)         groups#index
#                    POST     /groups(.:format)           groups#create
# new_group          GET      /groups/new(.:format)             groups#new
#edit_group          GET      /groups/:id/edit(.:format)            groups#edit
#  group             GET      /groups/:id(.:format)                 groups#show
#                    PATCH    /groups/:id(.:format)              groups#update
#                    PUT      /groups/:id(.:format)           groups#update
#                    DELETE   /groups/:id(.:format)            groups#destroy                  
                    



 
 
    



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
