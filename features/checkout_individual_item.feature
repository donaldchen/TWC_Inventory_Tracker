Feature: Checkout Individual Item
  As a volunteer
  I want to checkout an individual item
  So I can help patients with immediate needs

  Background:
  	Given I am logged in
  	Given the following items exist in the inventory
    | item                  | code       | quantity |
    | test1                 | 13371      | 1337     |
    | test2                 | 13372      | 1337     |
    | test3                 | 13373      | 1337     |

  Scenario: Create empty work order
  	Given I am on the Work Order page
  	And I make a new Work Order
  	Then I should be on the Item List page for order number "91235"

  Scenario: Checkout one item
    Given I am on the Item List page for order number "91235"
    And I follow "Store Item"
    And I fill in "ItemCode" with "13371"
  	And I fill in "Quantity" with "3"
  	And I press "Add"
  	Then I should see "test1" with quantity "1"

  Scenario: Refresh Salesforce state
  	And I delete Work Order with id "91235"
  	Then I go to the Store Item page
  	When I fill in "Item Code" with "13371"
  	And I fill in "Quantity" with "1"
  	And I press "Store"

  Scenario: Create new work order with used id
  	Given I am on the Work Order page
  	And I make a new Work Order with used id
  	Then I should be on the Item List page for order number "91235"

  Scenario: Refresh Salesforce state
  	And I delete Work Order with id "91235"
  	Then I go to the Store Item page
  	When I fill in "Item Code" with "13371"
  	And I fill in "Quantity" with "1"
  	And I press "Store"