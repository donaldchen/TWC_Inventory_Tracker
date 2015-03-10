Feature: Index Page
  As a logged in user
  I want to chose to store or checkout items, manually or non-manually
  So that I can do the correct job

Scenario: not logged in
  Given I am not logged in
  When I go to Index
  Then I should see "Please log in"

Scenario: choose manual storage
  Given I am logged in
  And I am on Index
  When I press Manual Store
  Then I should be on Manual Store

Scenario: choose scanner storage
  Given I am logged in
  And I am on Index
  When I press Scanner Store
  Then I should be on Scanner Store

Scenario: choose work order page
  Given I am logged in
  And I am on Index
  When I press Work Order
  Then I should be on the Work Order Page

Scenario: displays storage and checkout buttons
  Given I am logged in
  And I am on Index
  Then I should see Scanner Store
  And I should see Manual Store
  And I shoudl see Work Order