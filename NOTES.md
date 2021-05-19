HomeManager - group task app 

An admin user can create, edit and destroy lists. An admin user can crteate tasks for those lists and assign them to lower tier users as well as edit an delete the lists and tasks. Lower tier users can mark tasks as complete. 

Need: 

-Admin User (mom, boss) - email password username - admin? 
-Child users (kids, employees) email password username - admin?

-lists: 
    *title

-tasks: 
    *title
    *status
    *assigned user

~~~~~~~~~~~~~~~~~~~~~~~~~~~~

User -  has_many :lists 
        has_many :tasks, through: :lists 

List - has_many tasks
       has_many :users, through :tasks 


Task - belongs_to :user 
       belongs_to :list



    USE : 

    devise - login/out/up
    omniauth - fb login option
    activestorage - add images to tasks or lists ?????