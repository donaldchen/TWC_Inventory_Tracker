Feature: Analytics - History
  As an administrator at There With Care
  I want to see the transaction history of the inventory
  So I know when things have been added and deleted
  
Background:
  
  Given the following changes to the inventory occurred
     | item                   | amount       | date            |
     | Gas Card               | -13          | 5/1/2015        |
     | Bananas                | 51           | 5/1/2015        |
  
  Given I am logged in as admin
  Given I am on the Analytics History Page
  
Scenario: Display page by date
  Then I should see "History"
  And I should see "May 01, 2015"
  And I should see "Added" with quantity "51"
  And I should see "Subbed" with quantity "13"
  And I should see "Bananas 51 0"
  And I should see "Gas Card 0 13"