Feature: Update Quantities
  As a volunteer
  I want to manually set the quantity of an item
  So I can synchronize the physical inventory with the database

  Background:
    Given I am logged in
    Given the following items exist in the inventory
    | item                  | code | quantity |
    | diapers               | 000  | 5        |
    | toothbrush            | 001  | 3        |
    | hand soap             | 002  | 3        |
    | towel                 | 003  | 3        |
    | tissue box            | 004  | 3        |
    | crayon boxes          | 005  | 3        |
    | car seat              | 006  | 3        |

  	When I am on the Update Quantities page
    And I should see "5"
  	And I follow "diapers"
  	Then I should be on the Update Item page for "diapers"

  Scenario: Update item quantity correctly
    When I fill in "CorrectQuantity" with "7"
  	And I press "Update"
  	Then I should be on the Update Quantities page
  	And I should see "7"

  Scenario: Update item with non-numeric quantity
    When I fill in "CorrectQuantity" with "blah"
    And I press "Update"
    Then I should be on the Update Item page for "diapers"


