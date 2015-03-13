Feature: Index Page
  As a logged in user
  I want to chose to store or checkout items, manually or non-manually
  So that I can do the correct job

Scenario: not logged in
  Given I am not logged in
  When I go to the login page
  Then I should see "Login Page"

Scenario: choose work order page
  Given I am logged in
  When I press "Work Order"
  Then I should be on the Work Order page

Scenario: displays storage and checkout buttons
  Given I am logged in
  Then I should see "Scanner Store" button
  And I should see "Manual Store" button
  And I should see "Work Order" button