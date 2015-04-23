Feature: Analytics - Trajectory
  As an administrator at There With Care
  I want to be able to see trends in the inventory
  So that I can better address future inventory needs
  
Background:
  Given the following items exist in the inventory
	  | item                  | code         | quantity  | price  |
	  | test1                 | 13371        | 1347      | 1      |
  
  Given the following changes to the inventory occurred
     | item                   | amount       | date            |
     | test1                  | -13          | 1/1/2015        |
     | test1                  | -5           | 2/1/2015        |
     | test1                  | -7           | 3/1/2015        |
     | test1                  | +16          | 12/1/2014       |
  
  Given I am logged in as admin
  Given I am on the Analytics Trajectory Page
  
Scenario: Display average change per month
  When I click "per month"
  Then I should see "test1" with quantity "-2.25"
  
Scenario: Display average change per year
  Then I should see "test1" with quantity "-0.75"