Feature: Get work order
  As a volunteer
  I want enter the work order code
  So I obtain the list of items to get for the care package

Background:
  Given I am logged in
  And the following work order with order number "000001" exists
  | item                  | quantity |
  | diapers               | 3        |
  | toothbrush            | 1        |

Scenario: select valid work order
  Given I am on the Work Order page
  When I fill in "work order code" with "000001"
  And I press "enter"
  Then I should be on the Item List page for order number "000001"

Scenario: select invalid work order
  Given when I am on the Work Order page
  When I fill in "work order code" with "DOESNTWORK"
  And I press "enter"
  Then I should be on the Work Order page
  And I should see "Invalid order number"




