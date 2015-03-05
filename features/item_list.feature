Feature: item list
  As a volunteer
  I want to view and edit a list of items
  So I can correctly choose the items in the care package

Background:
  Given I am logged in
  And the following items exist in the inventory
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

Scenarios:
  Given I am on the Item List Page for order number "000001"
  Then I should see "diapers" with quantity "3"
  And I should see "toothbrush" with quantity "1"

  Given I am on the Item List Page for order number "000001"
  And I press "delete" for "diapers"
  Then I should be on the Item List Page for order number "000001"
  And I should not see "diapers" with quantity "3"

  Given I am on the Item List Page for order number "000001"
  And I press "edit"
  Then I should be on the Add to Work Order Page
  
  Given I am on the Item List Page for order number "000001"
  And I press "confirm"
  Then I should be on the Confirmation Page

  Given I am on the Item List Page for order number "000001"
  And I press "cancel"
  Then I should be on the Work Order Page