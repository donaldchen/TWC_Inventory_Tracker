Feature: confirmation
  As a volunteer
  I want to confirm that a care package has been delivered
  So that it can be listed as closed and completed

Background:

  #Given I am logged in
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

Scenario: yes, confirm delivery
  Given I am on the Confirmation page for order number "000001"
  And I press "Delivered"
  Then I should be on the Work Order page

Scenario: no, don't confirm delivery
  Given I am on the Confirmation page for order number "000001"
  And I press "Go Back"
  Then I should be on the Item List page for order number "000001"
