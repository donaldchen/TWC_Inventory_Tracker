Feature: item list
  As a volunteer
  I want to view and edit a list of items
  So I can correctly choose the items in the care package

Background:
  Given I am logged in
  Given the following items exist in the inventory
  | item                  | code       | quantity |
  | test1                 | 13371      | 1337     |
  | test2                 | 13372      | 1337     |
  | test3                 | 13373      | 1337     |

  And the following work order with order number "1337" exists
  | item                  | quantity |
  | test1                 | 1        |
  | test2                 | 1        |

Scenario: correct items for work order displayed
  Given I am on the Item List page for order number "1337"
  Then I should see "test1" with quantity "1"
  And I should see "test2" with quantity "1"

Scenario: add valid item
  Given I am on the Item List page for order number "1337"
  And I press "Add"
  And I fill in "ItemCode" with "13373"
  And I fill in "Quantity" with "3"
  And I press "add to cart"
  Then I should see "test1" with quantity "1"
  And I should see "test2" with quantity "1"
  And I should see "test3" with quantity "3"

Scenario: update quantities
  Given I am on the Item List page for order number "1337"
  When I fill in "item_newvalue1" with "10"
  And I press "Update"
  And I should see "test1" with quantity "10"
  And I fill in "item_newvalue1" with quantity "1"
  And I press the Update button
  
Scenario: delete item from work order
  Given I am on the Item List page for order number "1337"
  And I press "delete" for "test3"
  Then I should not see "test3" with quantity "3"
 
Scenario: confirm work order
  Given I am on the Item List page for order number "1337"
  And I press "Checkout"
  Then I should be on the Confirmation page for order number "1337"

Scenario: cancel current job
  Given I am on the Item List page for order number "123"
  And I press "Cancel"
  Then I should be on the Work Order page

Scenario: special instructions displayed
  Given I am on the Item List page for order number "1337"
  Then I should see "Treat with careful swag."
