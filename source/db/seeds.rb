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
	user = User.find(rand(1..20))
	api.reviews << review
	user.reviews << review

}

100.times {
	vote = Vote.create()
	user = User.find(rand(1..20))
	review = Review.find(rand(1..50))
	user.votes << vote
	review.votes << vote
}

100.times {
	comment = Comment.create(content: Faker::Lorem.sentence(3))
	user = User.find(rand(1..20))
	review = Review.find(rand(1..50))
	user.comments << comment
	review.comments << comment
}


