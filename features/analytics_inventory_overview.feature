Feature: Analytics - Inventory Overview
  As an administrator at There With Care
  I want to be able to see useful statistics about the current inventory state
  So that I can manage the inventory most effectively
  
Background:
  Given the following items exist in the inventory
	  | item                  | code         | quantity  | price  |
	  | test1                 | 13371        | 1347      | 1      |
	  | test2                 | 13372        | 1332      | 2      |
	  | bananas               | 000001235    | 15        | 5      |
  Given I am logged in as admin
  Given I am on the Analytics Inventory Overview Page
  
Scenario: Refresh and Display total counts
  Given I click "refresh"
  Then I should see "test1" with quantity "1347"
  And I should see "test2" with quantity "1332"
  And I should see "bananas" with quantity "15"

Scenario: Order by total counts
  Given I click "order by counts"
  Then I should see "test1" before "test2"
  And I should see "test2" before "bananas"
  
Scenario: Order by price
  Given I click "order by price"
  Then I should see "bananas" before "test2"
  And I should see "test2" before "test1"
  
Scenario: Order by name
  Given I click "order by name"
  Then I should see "bananas" before "test1"
  And I should see "test1" before "test2"