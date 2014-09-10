# return_arrays = []
# CSV.foreach("database.csv") do |row|
#    return_arrays << row.to_a
# end

# # p return_arrays[1]
# # puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
# # fixed_row = return_arrays[1].gsub!("^", ",")
# # return_arrays << fixed_row
# # puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
# # p return_arrays

# api_attributes = return_arrays.transpose

# api_attributes.each do |api|
#   title = api[0]
#   description = api[1]
#   key_required = api[]
#   documentation = api[]
#   Api.create(
#     title: title,
#     description: description,
#     tips: Faker::Lorem.sentence(3),
#     average_score: 0,
#     logo_url: null,
#     key_required: key_required,
#     documentation: documentation,
#   )
# end
  
# ============================================================================
# ==================== QUERY PROGRAMMABLE WEB API ============================
# ============================================================================

require 'rest_client'
require 'json'
response = RestClient.get 'http://www.programmableweb.com/pw-api/views/query_apis', {
  :params => { 
    'api-key' => 'NM2UJn3mhn2WgG9tLd3zTFG7sd8jdw9G', 
    'display_id' => 'api', 
    'limit' => 100
  }
}
json_response = Hash.from_xml(response)
api_array = json_response["result"]["item"]

# ********************************************************
# **************** API ATTRIBUTES ************************
# ********************************************************

titles = api_array.map do |api|
  title = api["title"]
  title.include?(",") ? title.gsub!(",", "^") : title
end

# THIS NEEDS TO CHECK FOR AND REMOVE COMMAS
descriptions = api_array.map do |api|
  desc = api["field_api_description"]["und"]["item"]["value"]
  if desc == nil
    desc = "description unavailable"
  else
    if desc.include?(",")
      desc.gsub!(",", "^")
    end 
    desc = desc.gsub(/[\n]/, " ")
  end 
end

key_required = api_array.map do |api|
  if api["field_api_developer_key_required"] == nil
    key = "unknown"
  else
    key = api["field_api_developer_key_required"]["und"]["item"]["value"]
    if key == nil
      key = "unknown"
    else
      key
    end
  end
end

endpoint_url = api_array.map do |api|
  if api["field_api_endpoint"]["und"]["item"]["value"] == nil
    endpoint = "unavailable"
  else
    endpoint = api["field_api_endpoint"]["und"]["item"]["value"]
  end
end

dev_homepage = api_array.map do |api|
  homepage = api["field_api_home_page"]["und"]["item"]["url"]
end

# THIS NEEDS TO CHECK FOR AND REMOVE COMMAS
# TODO: REGEX to remove the word "service" & "services"
category = api_array.map do |api|
  cat = api["field_api_summary"]["und"]["item"]["value"]
end

# terms_of_service = json_response["result"]["item"][0]["field_api_terms_of_service"]["und"]["item"]["value"]
# usage_limits = json_response["result"]["item"][0]["field_api_usage_limits"]["und"]["item"]["value"]
# image_url = users can add this / use the scrape logo API

# ********************************************************
# ********************************************************


# puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# puts api_array.length
# puts titles.length
# puts descriptions.length
# puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
# # print descriptions
# # puts
# puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

CSV.open("database.csv", "wb") do |csv| # change this so that new rows of attributes are appended (ab)
  csv << titles
  csv << descriptions
  csv << key_required
  csv << endpoint_url
  csv << dev_homepage
  csv << category
end


# //////////////////////////////////////////////////////////////////////
# ////////////////////// FAKE SEED DATA ////////////////////////////////
# //////////////////////////////////////////////////////////////////////

# 20.times {
#   user = User.new(email: Faker::Internet.email,
#           about_me: Faker::Lorem.sentence(3),
#           picture_url: 'http://www.chadcreates.com/wp-content/uploads/2009/05/People-128.png'
#           )
#   user.password = Faker::Internet.password
#   user.save
# }

# 50.times {
#   review = Review.create(score: rand(1..5),
#                  content: Faker::Lorem.sentence(3),
#                    title: Faker::Lorem.word)

#   api = Api.find(rand(1..10))
#   user = User.find(rand(1..20))
#   api.reviews << review
#   user.reviews << review
# }

# 100.times {
#   vote = Vote.create()
#   user = User.find(rand(1..20))
#   review = Review.find(rand(1..50))
#   user.votes << vote
#   review.votes << vote
# }

# 100.times {
#   comment = Comment.create(content: Faker::Lorem.sentence(3))
#   user = User.find(rand(1..20))
#   review = Review.find(rand(1..50))
#   user.comments << comment
#   review.comments << comment
# }
