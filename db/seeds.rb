# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(email: 'yeezy@ez.e', password: 'ezezezez', password_confirmation: 'ezezezez')
team = Team.create!(name: 'EZteam')
TeamMembership.create!(user_id: user.id, team: team).owner!
Question.create!(title: 'Question #1', body: 'Where are you from?')
Interview.create!(name: 'Alexey Chernov', appointed_at: 4.days.from_now)
