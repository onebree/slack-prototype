# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

room = Room.create!(:name => "general")

hunter = User.create!(:username => "hunter", :password => "rubyist_0")

steven = User.create!(:username => "steven", :password => "rubyist_1")

3.times do |n|
  room.messages.create!(:body => "This is message number #{n}.", :user => hunter)
end
