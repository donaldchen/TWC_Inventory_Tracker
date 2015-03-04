Feature: manual store
  As a volunteer
  I want to be able to perform a manual entry
  So that I can input inventory when the camera doesn't work

Background:
  Given I am logged in
  And the following items exist in the inventory
  | item                  | code |
  | diapers               | 000  |
  | toothbrush            | 001  |
  | hand soap             | 002  |
  | towel                 | 003  |
  | tissue box            | 004  |
  | crayon boxes          | 005  |
  | car seat              | 006  |

Scenarios:

  # Input valid code for item
  When I fill in "item code" with "000"
  And I fill in "number of items" with "3"
  Then I press "add"
  Then I should be on the Store Confirmation page

  # Input invalid code for item
  When I fill in "item code" with "999"
  And I fill in "number of items" with "4"
  Then I press "add"
  Then I should be on the Manual Store Page
  And I should see 'item not found' 

  # Input invalid number of items
  When I fill in "item code" with "000"
  And I fill in "number of items" with "no"
  Then I press "add"
  Then I should be on the Manual Store Page
  And I should see 'number of items must be numeric' 
