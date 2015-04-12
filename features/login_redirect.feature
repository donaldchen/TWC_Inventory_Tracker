Feature: Login Redirect
  As a TWC staff
  I want volunteers to only have app access after logging in
  So I can ensure that only background checked volunteers manage the inventory

  Background:
  	Given I am not logged in

  Scenario: Redirect from Work Order page
  	When I go to the Work Order page
  	Then I should be on the login page
  	And I should see "Please login to access the application."

  Scenario: Redirect from Store Item page
  	When I go to the Store Item page
  	Then I should be on the login page
  	And I should see "Please login to access the application."

  Scenario: Redirect from Update Quantities page
  	When I go to the Update Quantities page
  	Then I should be on the login page
  	And I should see "Please login to access the application."
