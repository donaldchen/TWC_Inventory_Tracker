Feature: Index Page
  As a logged in user
  I want to chose to store or checkout items, manually or non-manually
  So that I can do the correct job

Scenario: not logged in
  Given I am not logged in
  When I go to the login page
  Then I should see "Login"

Scenario: choose work order page
  Given I am logged in
  When I follow "Work Order"
  Then I should be on the Work Order page

Scenario: displays storage and checkout buttons
  Given I am logged in
  Then I should see "Scanner Store" link
  And I should see "Store Item" link
  And I should see "Work Order" link
  
Scenario: logout
 Given I am logged in
 When I press "Logout"
 Then I should see "Logout Successful"