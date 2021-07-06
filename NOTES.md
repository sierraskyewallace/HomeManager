HomeManager 

User - hasmany :lists
               :invites
               :assignments
               :tasks, thru :lists
               :belongs_to :group_member

List(JOIN) - hasmany :tasks
             belongs_to :user

Task - belongs_to :list 
       belongs_to :assignment

Invite - -------

Assignment(JOIN) - belongs_to :group_member 
                              :task

Group -            hasmany :group_members
                   ?

GroupMember (JOIN) - belongs_to :user 
                     belongs_to :group

                     

User CRUD list, invite other users, and assigns tasks.

