Given(/^I am on the www\.localhost\.me homepage$/) do
  visit 'localhost:3000'
end

Then(/^I will search for "(.*?)"$/) do |searchText|
  fill_in 'first-test', :with => searchText
end

Then(/^I will click Search button$/) do
  click_button('search')
end

Then(/^I should see "(.*?)"$/) do |expectedText|
  page.should have_content(expectedText)
end
