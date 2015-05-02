Feature: Analytics - Trajectory
  As an administrator at There With Care
  I want to be able to see trends in the inventory
  So that I can better address future inventory needs
  
Background:
  Given the following items exist in the inventory
	  | item                  | code         | quantity  | price  |
	  | goat                  | 67890        | 4         | 9000   |
  
  Given the following changes to the inventory occurred
     | item                   | amount       | date            |
  
  Given I am logged in as admin
  Given I am on the Analytics Trajectory Page

Scenario: Display list of all items
  Then I should see "goat"
  
Scenario: Display average change for goat
  When I follow goat
  Then I should see "Day"
  Then I should see "Month"
  Then I should see "year"