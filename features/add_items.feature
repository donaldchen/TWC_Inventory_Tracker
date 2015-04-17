Feature: Add Items
  As a volunteer
  I want to add new items to the inventory
  So I can keep track of the quantity of each item.

  Background:
    Given I am logged in
  	Given the following items exist in the inventory
	  | item                  | code         | quantity  |
	  | test1                 | 13371        | 1345      |
	  | bananas               | 000001235    | 15        |

  	Given I am on the Store Item page

  Scenario: add valid item
  	When I fill in "ItemCode" with "000001235"
  	And I fill in "Quantity" with "3"
  	And I press "Store"
  	Then I should be on the Store Item page
  	And I should see "3 Bananas Added"

  Scenario: add invalid item
  	When I fill in "ItemCode" with "13958619328756"
  	And I fill in "Quantity" with "3"
  	And I press "Store"
  	Then I should be on the Store Item page
  	And I should see "Invalid Item Code"

  Scenario: refresh Salesforce state
    When I am on the Update Quantities page
    And I follow "test1"
    Then I should be on the Update Item page for "13371"
    When I fill in "CorrectQuantity" with "1345"
    And I press "Update"
    Then I should be on the Update Quantities page

