# ============================================================================
# ==================== QUERY PROGRAMMABLE WEB API ============================
# ============================================================================
def replace_commas(string)
  string.gsub(",", "^")
end

response = RestClient.get 'http://www.programmableweb.com/pw-api/views/query_apis', {
  :params => { 
    'api-key' => 'lol', 
    'display_id' => 'api', 
    'limit' => 13000
  }
}
json_response = Hash.from_xml(response)
api_array = json_response["result"]["item"]
puts api_array.count

# ********************************************************
# **************** API ATTRIBUTES ************************
# ********************************************************

titles = api_array.map do |api|
  title = api["title"]
  unless title.nil?
    replace_commas(title)
  end
end

descriptions = api_array.map do |api|
  desc = api["field_api_description"]["und"]["item"]["value"]
  if desc == nil
    desc = "description unavailable"
  else
    desc = desc.gsub(/[\n]/, " ")
    replace_commas(desc)
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
    replace_commas(endpoint)
  end
end

dev_homepage = api_array.map do |api|
  homepage = api["field_api_home_page"]["und"]["item"]["url"]
end

# TODO: REGEX to remove the word "service" & "services"
category = api_array.map do |api|
  cat = api["field_api_summary"]["und"]["item"]["value"]
  unless cat == nil
    replace_commas(cat)
  end
end

# ********************************************************
# ********************************************************

CSV.open("database.csv", "wb") do |csv| # change this so that new rows of attributes are appended (ab)
  csv << titles
  csv << descriptions
  csv << key_required
  csv << endpoint_url
  csv << dev_homepage
  csv << category
end
