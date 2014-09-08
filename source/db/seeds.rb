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

response = RestClient.get 'http://www.programmableweb.com/pw-api/views/query_apis', {:params => {'api-key' => 'NM2UJn3mhn2WgG9tLd3zTFG7sd8jdw9G', 'display_id' => 'api', 'keyword' => 'yelp', 'limit' => 1 }}

json_response = Hash.from_xml(response).to_json

puts json_response

# "field_api_blog": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "http://developer.yahoo.net/blog/",
#                         "value": "http://developer.yahoo.net/blog/"
#                     }
#                 }
#             }
            
# "field_api_description": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "Yahoo Maps API offers three ways to integrate maps into a website - a simple REST-based API for map images, an Ajax JavaScript API, and a Flash API. This summary refers to the AJAX API which is closest to Google and Microsoft models. \n\nThe Yahoo! AJAX Maps API lets developers add maps to their web sites using DHTML and JavaScript. Maps are fully embeddable and scriptable using the JavaScript programming language. Yahoo! Maps AS-Flash API&#039;s built-in geocoder means that developers can specify a physical address or latitude/longitude coordinates for a map&#039;s location, as needed. The Yahoo Map API can also provide for integrating geo-related information from Yahoo&#039;s products, such as local listings, traffic, weather, events, and photos. The functionality of the Maps API can be further extended to consume any other API.",
#                         "value": "Yahoo Maps API offers three ways to integrate maps into a website - a simple REST-based API for map images, an Ajax JavaScript API, and a Flash API. This summary refers to the AJAX API which is closest to Google and Microsoft models. \n\nThe Yahoo! AJAX Maps API lets developers add maps to their web sites using DHTML and JavaScript. Maps are fully embeddable and scriptable using the JavaScript programming language. Yahoo! Maps AS-Flash API's built-in geocoder means that developers can specify a physical address or latitude/longitude coordinates for a map's location, as needed. The Yahoo Map API can also provide for integrating geo-related information from Yahoo's products, such as local listings, traffic, weather, events, and photos. The functionality of the Maps API can be further extended to consume any other API."
#                     }
#                 }
#             }
            
# "field_api_developer_key_required": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "value": "Yes"
#                     }
#                 }
#             }
            
# "field_api_developer_portal": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "value": "---"
#                     }
#                 }
#             }
            
# "field_api_documentation": {
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
            
# "field_api_gallery": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "http://gallery.yahoo.com/maps",
#                         "value": "http://gallery.yahoo.com/maps"
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
            
#             "field_api_other_auth_model": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "API Key",
#                         "value": "API Key"
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
            
#             "field_api_signup_requirements": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "API Key",
#                         "value": "API Key"
#                     }
#                 }
#             }
            
#             "field_api_site_blog": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": null,
#                         "value": null
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
            
# "field_article_primary_category": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "tid": "19978"
#                     }
#                 }
#             }
            
# "field_article_secondary_category": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "tid": "20408"
#                     }
#                 }
#             }
            
# "field_article_related_companies": null

# "field_content_type_group": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "APIs",
#                         "value": "APIs"
#                     }
#                 }
#             }
            
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
            
# "field_popularity": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "value": "137"
#                     }
#                 }
#             }
            
# "field_provider_of_api": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "format": null,
#                         "safe_value": "http://yahoo.com",
#                         "value": "http://yahoo.com"
#                     }
#                 }
#             }
            
# "field_read_only_without_login": {
#                 "und": {
#                     "is_array": "true",
#                     "item": {
#                         "value": "Yes"
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
            
# "language": "und"

# "title": "Yahoo Maps"

            

