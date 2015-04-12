Feature: Get work order
  As a volunteer
  I want enter the work order code
  So I obtain the list of items to get for the care package

Background:
  Given I am logged in
  Given the following work order with order number "123" exists
  | item                  | quantity |
  | Bananas               | 5.0      |
  | Gas Card              | 1.0      |

Scenario: select valid work order
  Given I am on the Work Order page
  When I fill in "work_order_WorkOrderCode" with "123"
  And I press "Select Code"
  Then I should be on the Item List page for order number "123"

Scenario: non-numeric work order
  Given I am on the Work Order page
  When I fill in "work_order_WorkOrderCode" with "DOESNTWORK"
  And I press "Select Code"
  Then I should be on the Work Order page
  And I should see "Not a numeric work order"

Scenario: select invalid work order
  Given I am on the Work Order page
  When I fill in "work_order_WorkOrderCode" with "000002"
  And I press "Select Code"
  Then I should be on the Work Order page
  And I should see "Invalid work order code"
