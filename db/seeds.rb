# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(name: "Andrew Och", email: "andrew@gmail.com")
user2 = User.create(name: "Ann Kim", email: "ann@gmail.com")
user3 = User.create(name: "Ali Och", email: "ali@gmail.com")

Tweet.create(content: "Hello World!", user: user1)
