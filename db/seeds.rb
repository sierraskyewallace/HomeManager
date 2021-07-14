# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(email: "test1@test.com", password: "password", password_confirmation: "password")
user2 = User.create!(email: "test2@test.com", password: "password", password_confirmation: "password")
user3 = User.create!(email: "test3@test.com", password: "password", password_confirmation: "password")

group1 = Group.create!(name: "group1")
group2 = Group.create!(name: "group2")

groupmembership1 = GroupMembership.create!(user: user1, group: group1)
groupmembership2 = GroupMembership.create!(user: user2, group: group1)
groupmembership3 = GroupMembership.create!(user: user3, group: group2)

