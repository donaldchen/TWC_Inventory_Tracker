Feature: Get work order
  As a volunteer
  I want enter the work order code
  So I obtain the list of items to get for the care package

Background:
  Given the following work order with order number "000001" exists
  | item                  | quantity |
  | diapers               | 3        |
  | toothbrush            | 1        |

Scenario: select valid work order
  Given I am on the Work Order page
  When I fill in "WorkOrderCode" with "000001"
  And I press "Select Code"
  Then I should be on the Item List page for order number "000001"

Scenario: select invalid work order
  Given I am on the Work Order page
  When I fill in "WorkOrderCode" with "DOESNTWORK"
  And I press "Select Code"
  Then I should be on the Work Order page
  And I should see "Invalid order number"