HomeManager - group task app 

Admin user - can CRUD tasks (create, read, update, destroy)

child user - can read task and destroy(complete)

User - devise and omniauth 
        admin boolean ? (figure how to add that with omniauth)

        has many :tasks 


Task - name 
        completed status
        user id
        belongs to :user 

UserTask - join table? ^ above may be enough

Groups - user id 
        has many :users

        (some group of users that admin can see to assign tasks to)

USER STORY:

Admin user can full CRUD tasks and assignt hem to child users
A child usrr can view tasks assigned to them only and update their status to complete(update or destroy)

    

