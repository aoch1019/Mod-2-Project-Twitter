# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(name: "Andrew Och", email: "andrew@gmail.com", password_digest: "andrew")
user2 = User.create(name: "Ann Kim", email: "ann@gmail.com", password_digest: "ann")
user3 = User.create(name: "Ali Och", email: "ali@gmail.com", password_digest: "ali")

tweet1 = Tweet.create(content: "Hello World!", user: user1)

comment1 = Comment.create(content: "Hello", tweet: tweet1, user: user1)
