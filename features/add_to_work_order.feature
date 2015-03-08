Feature: add to work order
  As a volunteer
  I want to be able to add items to the work order
  So that I can edit the work order when situations change

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

Scenario: input valid code for item
  Given I am on the Add To Work Order page for order number "000001"
  When I fill in "item code" with "000"
  And I fill in "number of items" with "3"
  And I press "add to cart"
  Then I should be on the Item List page for order number "000001"

Scenario: input invalid code for item
  Given I am on the Add To Work Order page for order number "000001"
  When I fill in "item code" with "999"
  And I fill in "number of items" with "4"
  And I press "add to cart"
  Then I should be on Add To Work Order
  And I should see 'invalid item code' 

Scenario: input invalid number of items
  Given I am on the Add To Work Order page for order number "000001"
  When I fill in "item code" with "000"
  And I fill in "number of items" with "no"
  And I press "add to cart"
  Then I should be on Add To Work Order
  And I should see 'number of items must be numeric' 

Scenario: input valid code for item
  Given I am on the Add To Work Order page for order number "000001"
  When I fill in "item code" with "000"
  And I fill in "number of items" with "100"
  And I press "add to cart"
  Then I should be on Add To Work Order
  And I should see 'not enough items in inventory' 

Scenario: return to item list
  Given when I am on Add To Work Order for order number "000001"
  When I press "Go Back"
  Then I should see the Item List page for order number "000001"

