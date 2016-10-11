# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hunter = User.new(:username => "hunter", :password => "rubyist_0")
hunter.save

steven = User.new(:username => "steven", :password => "rubyist_1")
steven.save

3.times do |n|
  hunter.messages.create(:body => "This is message number #{n}.")
end
