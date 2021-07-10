class Group < ActiveRecord::Base
  groupify :group, members: [:users, :tasks], default_members: :users
end
