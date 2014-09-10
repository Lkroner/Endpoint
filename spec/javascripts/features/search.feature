Feature: Search for API from homepage
  In order to search for a certain API
  As an API enthusiast
  I want to see a list of all relevant API's

Scenario: Enter a valid search term
    Given I am on the www.endpoint.me homepage
    Then I will search for "et"
    Then I will click Search button
    Then I should see "et"

