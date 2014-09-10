Feature: Search for API from homepage
  In order to search for a certain API
  As an API enthusiast
  I want to see a list of all relevant API's

  Background:
    Given I am on the www.localhost.me homepage

  Scenario: Enter a valid search term
    Then I will search for "et"
    Then I will click Search button
    Then I should see "et"

  Scenario: Enter an invalid search term
    Then I will search for "li"
    Then I will click Search button
    Then I should see "Sorry, we don't have anything that matches that."