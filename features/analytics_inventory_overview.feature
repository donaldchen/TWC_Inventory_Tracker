Feature: Analytics - Inventory Overview
  As an administrator at There With Care
  I want to be able to see useful statistics about the current inventory state
  So that I can manage the inventory most effectively
  
Background:
  Given the following items exist in the inventory
	  | item                  | code         | quantity  | price  |
	  | test1                 | 13371        | 1347      | 1      |
	  | test2                 | 13372        | 1337      | 2      |
	  | Bananas               | 000001235    | 165        | 5      |
  Given I am logged in as admin
  Given I am on the Analytics Inventory Overview Page
  
Scenario: Display total counts
  Then I should see "test1" with quantity "1347"
  And I should see "test2" with quantity "1337"
  And I should see "Bananas" with quantity "165"

Scenario: Order by total counts
  Given I follow "Quantity"
  Then I should see "Bananas" before "test2"
  And I should see "test2" before "test1"
  
Scenario: Order by price
  Given I follow "Price"
  Then I should see "test1" before "test2"
  And I should see "test2" before "Bananas"
  
Scenario: Order by name
  Given I follow "Item"
  Then I should see "Bananas" before "test1"
  And I should see "test1" before "test2"