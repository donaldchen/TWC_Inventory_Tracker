Feature: item list
  As a volunteer
  I want to view and edit a list of items
  So I can correctly choose the items in the care package

Background:
  #Given I am logged in
  #And the following items exist in the inventory
  Given the following items exist in the inventory
  | item                  | code | quantity |
  | diapers               | 000  | 3        |
  | toothbrush            | 001  | 3        |
  | hand soap             | 002  | 3        |
  | towel                 | 003  | 3        |
  | tissue box            | 004  | 3        |
  | crayon boxes          | 005  | 3        |
  | car seat              | 006  | 3        |

  And the following work order with order number "000001" exists
  | item                  | quantity |
  | diapers               | 3        |
  | toothbrush            | 1        |

Scenario: correct items for work order displayed
  Given I am on the Item List page for order number "000001"
  Then I should see "diapers" with quantity "3"
  And I should see "toothbrush" with quantity "1"

Scenario: delete item from work order
  Given I am on the Item List page for order number "000001"
  And I press "delete" for "diapers"
  Then I should be on the Item List Page
  And I should not see "diapers" with quantity "3"

Scenario: add a new item to work order
  Given I am on the Item List page for order number "000001"
  And I press "Add"
  Then I should be on the Add To Work Order page for order number "000001"
 
Scenario: confirm work order
  Given I am on the Item List page for order number "000001"
  And I press "Checkout"
  Then I should be on the Confirmation page for order number "000001"

Scenario: cancel current job
  Given I am on the Item List page for order number "000001"
  And I press "Cancel"
  Then I should be on the Work Order page
