Feature: work order checkout
  As a volunteer
  I want to checkout a group of items at once
  So I can confirm delivering a package to a patient

Scenarios:
  Given I am on the Work Order page
  When I fill in "work order code" with "000001"
  Then I press "enter"
  Then I should be on the Item List page

  Given I am on the Item List Page
  When I select the quantity of "diapers" to be "3"
  And I press "checkout"
  Then I should be on the Confirmation page

  Given I am on the Confirmation page
  Then I should see "confirm checkout?"
  When I press "no"
  I should be on the Item List page

  Given I am on the Confirmation page
  Then I should see "confirm checkout?"
  When I press "yes"
  I should be on the Work Order page

  Given I am on the Item List page
  And I press "add item"
  Then I should be on the Add Item page

  Given I am on the Add Item page
  When I fill in "item code" with "000"
  And I select the quantity of "toothbrush" to be "4"
  And I press "confirm item"
  Then I should be on the Item List page


