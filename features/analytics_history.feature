Feature: Analytics - History
  As an administrator at There With Care
  I want to see the transaction history of the inventory
  So I know when things have been added and deleted
  
Background:
  Given the following items exist in the inventory
	  | item                  | code         | quantity  | price |
	  | test1                 | 13371        | 1347      | 1     |
	  | test2                 | 13372        | 1332      | 2     |
	  | bananas               | 000001235    | 15        | 5     |
  
  Given the following changes to the inventory occurred
     | item                   | amount       | date            |
     | test1                  | +13          | 1/1/2001        |
     | test2                  | +15          | 1/1/2001        |
     | test1                  | -50          | 10/12/2013      |
     | bananas                | +1           | 2/2/1859        |
  
  Given I am logged in as admin
  Given I am on the Analytics History Page
  
Scenario: Display overall inventory changes by date
  When I click "Display all"
  Then I should see "Total Inventory Change"
  And I should see date "10/12/2013" with "0" added and "50" deleted
  And I should see date "1/1/2001" with "28" added and "0" deleted
  And I should see date "2/2/1859" with "1" added and "0" deleted
  
Scenario: Display individual item changes
  When I click "test1"
  Then I should see "test1 Change"
  And I should see date "10/12/2013" with "0" added and "50" deleted
  And I should see date "1/1/2001" with "13" added and "0" deleted