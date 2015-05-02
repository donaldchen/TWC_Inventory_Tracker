Feature: Analytics - Trajectory
  As an administrator at There With Care
  I want to be able to see trends in the inventory
  So that I can better address future inventory needs
  
Background:
  Given the following items exist in the inventory before changes
	  | item                  | code         | quantity  | price  |
	  | Goat                  | 67890        | 4         | 9000   |
  
  Given the following changes to the inventory occurred
     | item                   | amount       | date            |
     | Goat                   | 2            | 5/02/2015       |
  
  Given I am logged in as admin
  Given I am on the Analytics Trajectory Page

Scenario: Display list of all items
  Then I should see "Goat"
  
Scenario: Display change for goat
  When I follow "Goat"
  Then I should see "Month" with quantity "2"
  Then I should see "Year" with quantity "2"

Scenario: Display updated change for goat
  When I am on the Update Quantities page
  And I follow "Goat"
  When I fill in "New Quantity" with "4"
  And I press "Update"
  When I am on the Analytics Trajectory Page
  And I follow "Goat"
  Then I should see "Month" with quantity "0"
  Then I should see "Year" with quantity "0"
  When I am on the Update Quantities page
  And I follow "Goat"
  When I fill in "New Quantity" with "6"
  And I press "Update"
