Feature: Update Quantities
  As a volunteer
  I want to manually set the quantity of an item
  So I can synchronize the physical inventory with the database

  Background:
    Given the following items exist in the inventory
    | item                  | code | quantity |
    | diapers               | 000  | 5        |
    | toothbrush            | 001  | 3        |
    | hand soap             | 002  | 3        |
    | towel                 | 003  | 3        |
    | tissue box            | 004  | 3        |
    | crayon boxes          | 005  | 3        |
    | car seat              | 006  | 3        |

  Scenario: Update item quantity
  	When I am on the Update Quantities page
  	And I press "diapers"
  	And I should see "5"
  	Then I should be on the Update Item page for "diapers"
  	When I fill in "CorrectQuantity" with "7"
  	And I press "update"
  	Then I should be on the Update Quantities page
  	And I should see "7"


