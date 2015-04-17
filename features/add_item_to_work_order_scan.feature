Feature: Add Item to Work Order (Scan)
  As a volunteer
  I want to scan an item code
  So I can add items to the work order quickly

Background:
	Given I am logged in
	Given I am on the Work Order page
  	When I fill in "WorkOrderCode" with "123"
  	And I press "Select Code"
  	Then I should be on the Item List page for order number "123"

Scenario: Access the scanner from the Work Order page
  Then I should be able to use the scanner for work order "123"