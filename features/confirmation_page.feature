Feature: Confirmation Page
  As a volunteer
  I want to confirm that a care package has been delivered
  So that it can be listed as closed and completed

Background:

  Given I am logged in
  And the following work order with order number "000001" exists
  | item                  | quantity |
  | diapers               | 3        |
  | toothbrush            | 1        |

Scenario: yes, confirm delivery
  Given I am on the Confirmation page for order number "000001"
  And I press "Delivered"
  Then I should be on Delivered.

Scenario: no, don't confirm delivery
  Given I am on the Confirmation Page for order number "000001"
  And I press "Go Back"
  Then I should be on the Item List Page for order number "000001"
