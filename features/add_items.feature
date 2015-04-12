Feature: Add Items
  As a volunteer
  I want to add new items to the inventory
  So I can keep track of the quantity of each item.

  Background:
    Given I am logged in
  	Given the following items exist in the inventory
	| item                  | code | quantity |
	| diapers               | 000  | 3        |
	| toothbrush            | 001  | 3        |
	| hand soap             | 002  | 3        |
	| towel                 | 003  | 3        |
	| tissue box            | 004  | 3        |
	| crayon boxes          | 005  | 3        |
	| car seat              | 006  | 3        |

  	Given I am on the Store Item page

  Scenario: add valid item
  	When I fill in "ItemCode" with "000"
  	And I fill in "Quantity" with "3"
  	And I press "Store"
  	Then I should be on the Store Item page
  	And I should see "3 Diapers Added"

  Scenario: add invalid item
  	When I fill in "ItemCode" with "007"
  	And I fill in "Quantity" with "3"
  	And I press "Store"
  	Then I should be on the Store Item page
  	And I should see "Invalid Item Code"

