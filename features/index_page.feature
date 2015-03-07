Feature: Index Page
  As a logged in user
  I want to chose to store or checkout items, manually or non-manually
  So that I can do the correct job

Scenario: not logged in
  When I am on the index page
  And I am not logged in
  Then I should go to login page
  And I should see login error message 2 

Scenario: choose manual storage  
  When I am on the index page
  And I click Manual Store
  Then I should be on the Manual Store Page

Scenario: choose scanner storage
  When I am on the index page
  And I click Scanner Store
  Then I should be on the Scanner Store Page

Scenario: choose manual checkout
  When I am on the index page
  And I click Manual Checkout
  Then I should be on the Manual Checkout Page

Scenario: choose scanner checkout
  When I am on the index page
  And I click Scanner Checkout
  Then I should be on the Scanner Checkout Page

Scenario: displays storage and checkout buttons
  When I am on the index page
  Then I should see Scanner Checkout Button
  And I should see Manual Checkout Button
  And I should see Scanner Store Button
  And I should see Manual Store Button
