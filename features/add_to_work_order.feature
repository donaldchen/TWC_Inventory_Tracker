Feature: add to work order
  As a volunteer
  I want to be able to add items to the work order
  So that I can edit the work order when situations change
  
Background:
  Given I am logged in
  Given the following items exist in the inventory
  | item                  | code       | quantity |
  | test1                 | 13371      | 1337     |
  | test2                 | 13372      | 1337     |
  | test3                 | 13373      | 1337     |

  And the following work order with order number "999" exists
  | item                  | quantity |
  | test1                 | 1        |
  | test2                 | 1        |

Scenario: input invalid item code
  Given I am on the Item List page for order number "999"
  And I follow "Store Item"
  And I fill in "ItemCode" with "000"
  And I fill in "Quantity" with "3"
  And I press "Store"
  Then I should see "invalid item code"

Scenario: input invalid number of items
  Given I am on the Add To Work Order page for order number "999"
  When I fill in "ItemCode" with "000001235"
  And I fill in "Quantity" with "no"
  And I press "Store"
  Then I should be on the Add To Work Order page for order number "999"
  And I should see "quantity must be numeric" 

Scenario: successfully add item to work order
  Given I am on the Add To Work Order page for order number "999"
  When I fill in "ItemCode" with "000001235"
  And I fill in "Quantity" with "10"
  And I press "Store"
  Then I should be on the Item List page for order number "999"
  And I should see "Bananas" with quantity "10"
  And I press the "Delete button" for "Bananas"


Scenario: return to item list
  Given I am on the Add To Work Order page for order number "999"
  When I follow "back_btn"
  Then I should be on the Item List page for order number "999"
