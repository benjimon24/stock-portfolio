# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(username: "dududu", email: "holla@you", password: "asdfasdf")
user2 = User.create(username: "testing123", email: "testing@123", password: "asdfasdf")

portfolio1 = user1.portfolios.create(name: "Portfolio 1")
portfolio2 = user1.portfolios.create(name: "Portfolio 2")
portfolio3 = user1.portfolios.create(name: "Portfolio 3")

stock1 = portfolio1.stocks.create(symbol: "GOOG", buy_price: 800.0, volume: 1000)
stock2 = portfolio1.stocks.create(symbol: "AAPL", buy_price: 150.0, volume: 1000)
stock3 = portfolio1.stocks.create(symbol: "MSFT", buy_price: 50.0, volume: 1000)
