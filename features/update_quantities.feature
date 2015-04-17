Feature: Update Quantities
  As a volunteer
  I want to manually set the quantity of an item
  So I can synchronize the physical inventory with the database

  Background:
    Given I am logged in
    Given the following items exist in the inventory
    | item                  | code       | quantity |
    | diapers               | 000001236  | 5        |
    | gas card              | 000049587  | 100      |


  	When I am on the Update Quantities page
    And I follow "Diapers"
    Then I should be on the Update Item page for "000001236"

  Scenario: Update item quantity correctly
    When I fill in "CorrectQuantity" with "7"
  	And I press "Update"
  	Then I should be on the Update Quantities page
  	And I should see "7"

  Scenario: Update item with non-numeric quantity
    When I fill in "CorrectQuantity" with "blah"
    And I press "Update"
    Then I should be on the Update Item page for "000001236"

  Scenario: Refresh Salesforce state
    When I fill in "CorrectQuantity" with "5"
    And I press "Update"
    Then I should be on the Update Quantities page
    And I should see "5"




