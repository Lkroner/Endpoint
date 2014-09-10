require 'rest_client'
require 'json'

return_arrays = []
CSV.foreach("database.csv") do |row|
   return_arrays << row.to_a
end

p return_arrays[1]
puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
return_arrays.each do |array|
  array.each do |string|
    unless string.nil?
      string.gsub!("^", ",")
    end
  end
end
puts "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

api_attributes = return_arrays.transpose
p api_attributes

api_attributes.each do |api|
  title = api[0]
  description = api[1]
  key_required = api[2]
  endpoint_url = api[3]
  dev_homepage = api[4]
  category = api[5]
  Api.create(
    title: title,
    description: description,
    average_score: 0,
    key_required: key_required,
    endpoint_url: endpoint_url,
    dev_homepage: dev_homepage,
    category: category
  )
end
  
# ============================================================================
# ==================== QUERY PROGRAMMABLE WEB API ============================
# ============================================================================
# def replace_commas(string)
#   string.gsub(",", "^")
# end

# response = RestClient.get 'http://www.programmableweb.com/pw-api/views/query_apis', {
#   :params => { 
#     'api-key' => 'lol', 
#     'display_id' => 'api', 
#     'limit' => 13000
#   }
# }
# json_response = Hash.from_xml(response)
# api_array = json_response["result"]["item"]
# puts api_array.count
# # ********************************************************
# # **************** API ATTRIBUTES ************************
# # ********************************************************

# titles = api_array.map do |api|
#   title = api["title"]
#   unless title.nil?
#     replace_commas(title)
#   end
# end

# descriptions = api_array.map do |api|
#   desc = api["field_api_description"]["und"]["item"]["value"]
#   if desc == nil
#     desc = "description unavailable"
#   else
#     desc = desc.gsub(/[\n]/, " ")
#     replace_commas(desc)
#   end 
# end

# key_required = api_array.map do |api|
#   if api["field_api_developer_key_required"] == nil
#     key = "unknown"
#   else
#     key = api["field_api_developer_key_required"]["und"]["item"]["value"]
#     if key == nil
#       key = "unknown"
#     else
#       key
#     end
#   end
# end

# endpoint_url = api_array.map do |api|
#   if api["field_api_endpoint"]["und"]["item"]["value"] == nil
#     endpoint = "unavailable"
#   else
#     endpoint = api["field_api_endpoint"]["und"]["item"]["value"]
#     replace_commas(endpoint)
#   end
# end

# dev_homepage = api_array.map do |api|
#   homepage = api["field_api_home_page"]["und"]["item"]["url"]
# end

# # TODO: REGEX to remove the word "service" & "services"
# category = api_array.map do |api|
#   cat = api["field_api_summary"]["und"]["item"]["value"]
#   unless cat == nil
#     replace_commas(cat)
#   end
# end

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

# CSV.open("database.csv", "wb") do |csv| # change this so that new rows of attributes are appended (ab)
#   csv << titles
#   csv << descriptions
#   csv << key_required
#   csv << endpoint_url
#   csv << dev_homepage
#   csv << category
# end


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
