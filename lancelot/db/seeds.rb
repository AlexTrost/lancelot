# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: "Alex", email: "User@user.user", password: "useruser", freelancer: true, last_active_at: Time.now)
User.create(name: "Alex3", email: "User@user.user3", password: "useruser", freelancer: true, last_active_at: Time.now)
alextwo = User.create(name: "Alex2", email: "User@user.user2", password: "useruser", freelancer: false, last_active_at: Time.now)

Post.create(title: "Rails Developer" , description: "Need a coder to code code", poster_information: alextwo.poster_information, budget: 300, hourly: false, awarded_to_id: 1 )
Post.create(title: "Painter" , description: "Need a painter to paint paint", poster_information: alextwo.poster_information, budget: 30, hourly: true )
Post.create(title: "Poet" , description: "Need a poet to poet poems", poster_information: alextwo.poster_information, budget: 3, hourly: true )

Application.create(post_id: 1, freelancer_information_id: 1, hourly: true, description: "I am a good coder", amount: 200)
Application.create(post_id: 1, freelancer_information_id: 2, hourly: false, description: "I am a coder", amount: 20)
