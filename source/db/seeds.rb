# 20.times {
# 	user = User.new(email: Faker::Internet.email,
# 					about_me: Faker::Lorem.sentence(3),
# 					picture_url: 'http://www.chadcreates.com/wp-content/uploads/2009/05/People-128.png'
# 					)
# 	user.password = Faker::Internet.password
# 	user.save
# }


# 10.times{
# 	Api.create(title: Faker::Lorem.word,
# 			   description: Faker::Lorem.sentence(3),
# 			   tips: Faker::Lorem.sentence(3),
# 			   average_score: rand(1.0..5.0),
# 			   logo_url: "http://www.nasa.gov/sites/default/files/sydney.b.boen/images/twitter-small(1).gifv"
# 			   )
# }

# 50.times {
# 	review = Review.create(score: rand(1..5),
# 				  		   content: Faker::Lorem.sentence(3),
# 				           title: Faker::Lorem.word)

# 	api = Api.find(rand(1..10))
# 	user = User.find(rand(1..20))
# 	api.reviews << review
# 	user.reviews << review

# }

# 100.times {
# 	vote = Vote.create()
# 	user = User.find(rand(1..20))
# 	review = Review.find(rand(1..50))
# 	user.votes << vote
# 	review.votes << vote
# }

# 100.times {
# 	comment = Comment.create(content: Faker::Lorem.sentence(3))
# 	user = User.find(rand(1..20))
# 	review = Review.find(rand(1..50))
# 	user.comments << comment
# 	review.comments << comment
# }

require 'rest_client'
require 'json'
response = RestClient.get 'http://www.programmableweb.com/pw-api/views/query_apis', {
  :params => { 
    'api-key' => 'NM2UJn3mhn2WgG9tLd3zTFG7sd8jdw9G', 
    'display_id' => 'api', 
    'limit' => 20 
  }
}
json_response = Hash.from_xml(response)
api_array = json_response["result"]["item"]

# *********************  ATTRIBUTES  *********************

# title = json_response["result"]["item"][0]["title"]
titles = api_array.map do |api|
  api["title"]
end

# description = json_response["result"]["item"][0]["field_api_description"]["und"]["item"]["value"]
descriptions = api_array.map.with_index do |api|
  api["field_api_description"]["und"]["item"]["value"]
end

# key_required = json_response["result"]["item"][0]["field_api_developer_key_required"]["und"]["item"]["value"]


# documentation = json_response["result"]["item"][0]["field_api_documentation"]["und"]["item"]["value"]
# endpoint_url = json_response["result"]["item"][0]["field_api_endpoint"]["und"]["item"]["value"]
# dev_homepage = json_response["result"]["item"][0]["field_api_home_page"]["und"]["item"]["url"]
# sample_call = json_response["result"]["item"][0]["field_api_sample_calls"]["und"]["item"]["value"]
# sample_response = users can add this
# dev_twitter_url = json_response["result"]["item"][0]["field_twitter_url"]["und"]["item"]["value"]
# category/type_of_service = json_response["result"]["item"][0]["field_api_summary"]["und"]["item"]["value"]
# terms_of_service = json_response["result"]["item"][0]["field_api_terms_of_service"]["und"]["item"]["value"]
# usage_limits = json_response["result"]["item"][0]["field_api_usage_limits"]["und"]["item"]["value"]
# image_url = users can add this / use the scrape logo API
# ********************************************************
puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
puts api_array.length
puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
print descriptions
puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"












puts json_response["result"]["item"][0]["title"]
# puts json_response["result"]["item"][21]["title"]
# puts json_response["result"]["item"][32]["title"]
# puts json_response["result"]["item"][99]["title"]
# puts json_response["result"]["item"][199]["title"]




