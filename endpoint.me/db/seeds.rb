# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times {
	User.create(email: Faker::Internet.email,
				password: Faker::Internet.password,
				about_me: Faker::Lorem.sentence(3),
				picture_url: 'http://www.chadcreates.com/wp-content/uploads/2009/05/People-128.png'
				)
}


10.times{
	Api.create(title: Faker::Lorem.word,
			   description: Faker::Lorem.sentence(3),
			   tips: Faker::Lorem.sentence(3),
			   average_score: rand(1..5),
			   logo_url: "http://www.nasa.gov/sites/default/files/sydney.b.boen/images/twitter-small(1).gifv"
			   )
}

50.times {
	review = Review.create(score: rand(1..5),
				  		   content: Faker::Lorem.sentence(3),
				           title: Faker::Lorem.word)

	api = Api.find(rand(1..10))
	api.reviews << review
}