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
response = RestClient.get 'http://www.programmableweb.com/pw-api/views/query_apis', {:params => {'api-key' => 'NM2UJn3mhn2WgG9tLd3zTFG7sd8jdw9G', 'display_id' => 'api', 'keyword' => 'yelp', 'limit' => 2 }}
json_response = Hash.from_xml(response)

# ***************  ATTRIBUTES  *********************
# title = json_response["result"]["item"][0]["title"]
# description = json_response["result"]["item"][0]["field_api_description"]["und"]["item"]["value"]
# key_required = json_response["result"]["item"][0]["field_api_developer_key_required"]["und"]["item"]["value"]
# documentation = json_response["result"]["item"][0]["field_api_documentation"]["und"]["item"]["value"]
# **************************************************

puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# puts JSON.pretty_generate(json_response)
puts json_response
puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"


puts json_response["result"]["item"][0]["field_api_documentation"]["und"]["item"]["value"]
puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
puts json_response["result"]["item"][1]["field_api_documentation"]["und"]["item"]["value"]


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++        

#             "field_api_documentation": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "value": "---"
#                     }
#                 }
#             }
            
#             "field_api_endpoint": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "http://api.maps.yahoo.com/ajaxymap?v=2.0&amp;appid=YourAppId",
#                         "value": "http://api.maps.yahoo.com/ajaxymap?v=2.0&appid=YourAppId"
#                     }
#                 }
#             }
            
#             "field_api_favicon": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "alt": null,
#                         "fid": "65324",
#                         "filemime": "image/vnd.microsoft.icon",
#                         "filename": "api_favicon62696.ico",
#                         "filesize": "748",
#                         "height": "16",
#                         "image_dimensions": {
#                             "height": "16",
#                             "width": "16"
#                         },
#                         "status": "1",
#                         "timestamp": "1397933571",
#                         "title": null,
#                         "type": "image",
#                         "uid": "1",
#                         "uri": "public://apis/favicon/api_favicon62696.ico",
#                         "width": "16"
#                     }
#                 }
#             }
            
#             "field_api_home_page": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "attributes": null,
#                         "title": null,
#                         "url": "http://developer.yahoo.com/maps/"
#                     }
#                 }
#             }
                   
#             "field_api_sample_calls": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "value": "---"
#                     }
#                 }
#             }
           
# "field_api_site_twitter_url": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": null,
#                         "value": null
#                     }
#                 }
#             }
            
# "field_api_summary": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "Mapping services",
#                         "value": "Mapping services"
#                     }
#                 }
#             }
            
# "field_api_terms_of_service": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "http://info.yahoo.com/legal/us/yahoo/maps/mapsapi/mapsapi-2141.html",
#                         "value": "http://info.yahoo.com/legal/us/yahoo/maps/mapsapi/mapsapi-2141.html"
#                     }
#                 }
#             }
  
# "field_api_usage_limits": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "Simple API has no rate limit. Others are 50,000 queries per IP per day. Also limit on using GPS sensors.",
#                         "value": "Simple API has no rate limit. Others are 50,000 queries per IP per day. Also limit on using GPS sensors."
#                     }
#                 }
#             }
                     
# "field_article_related_companies": null
            
# "field_image_upload": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "alt": "Yahoo Maps",
#                         "fid": "65323",
#                         "filemime": "image/png",
#                         "filename": null,
#                         "filesize": "2470",
#                         "height": "27",
#                         "image_dimensions": {
#                             "height": "27",
#                             "width": "130"
#                         },
#                         "status": "1",
#                         "timestamp": "1397933571",
#                         "title": "Yahoo Maps",
#                         "type": "image",
#                         "uid": "1",
#                         "uri": "public://apis/at31.png",
#                         "width": "130"
#                     }
#                 }
#             }
            
# "field_twitter_url": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": null,
#                         "value": null
#                     }
#                 }
#             }


            

