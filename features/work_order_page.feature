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

  Given the following closed work order with order number "6235876" exists

Scenario: select valid work order
  Given I am on the Work Order page
  When I fill in "Work Order Code" with "123"
  And I press "Select Code"
  Then I should be on the Item List page for order number "123"

Scenario: select closed work order
  Given I am on the Work Order page
  When I fill in "Work Order Code" with "6235876"
  And I press "Select Code"
  Then I should be on the Work Order page
  And I should see "Care Package has closed"

Scenario: non-numeric work order
  Given I am on the Work Order page
  When I fill in "Work Order Code" with "DOESNTWORK"
  And I press "Select Code"
  Then I should be on the Work Order page
  And I should see "Not a numeric work order"

Scenario: select invalid work order
  Given I am on the Work Order page
  When I fill in "Work Order Code" with "000002"
  And I press "Select Code"
  Then I should be on the Work Order page
  And I should see "Invalid work order code"
