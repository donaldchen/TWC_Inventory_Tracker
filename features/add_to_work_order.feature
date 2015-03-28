Feature: add to work order
  As a volunteer
  I want to be able to add items to the work order
  So that I can edit the work order when situations change

Background:
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

Scenario: input valid code for item
  Given I am on the Add To Work Order page for order number "000001"
  When I add ItemCode "000" with Quantity "3" 
  Then I should be on the Item List page for order number "000001"

Scenario: input invalid code for item
  Given I am on the Add To Work Order page for order number "000001"
  When I add ItemCode "999" with Quantity "4" 
  Then I should be on the Add To Work Order page for order number "000001"
  #And I should see "invalid item code" 

Scenario: input invalid number of items
  Given I am on the Add To Work Order page for order number "000001"
  When I add ItemCode "000" with Quantity "no"
  Then I should be on the Add To Work Order page for order number "000001"
  #And I should see "quantity must be numeric" 

Scenario: checkout more items than the inventory contains
  Given I am on the Add To Work Order page for order number "000001"
  When I add ItemCode "000" with Quantity "100"
  Then I should be on the Add To Work Order page for order number "000001"
  #And I should see "not enough items in inventory" 

Scenario: return to item list
  Given I am on the Add To Work Order page for order number "000001"
  When I press "Go Back"
  Then I should be on the Item List page for order number "000001"

