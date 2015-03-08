Feature: login page
  As a volunteer or staff
  I want to login
  So I can carry out my job with security

Background: movies have been added to database

  Given the following users exist:
  | user_name					                | password      |
  | sara.alexander@therewithcare.org 	| iamsara		    |	
  | donaldchen@berkeley.edu		        | iamnotsara		|
  | hi@gmail.com				              | imcool		    | 
  | bye@gmail.com				              | imnotcool		  | 
  | barackobama@whitehouse.gov		    | beatmccain		| 

  And I am a volunteer

Scenario: display login page
  # Login Visit
  Given I am on the login page
  Then I should see Username
  And I should see Password
  And I should see Login

Scenario: login with invalid email
  # Login Fail (1)
  Given I am on the login page
  When I fill in email with ‘d.chen72@gmail.com’
  And I fill in password with 'imnotsara'
  And I press 'login'
  Then I should be on Login
  And I should see "Invalid Credentials"

Scenario: login with invalid password
  # Login Fail (2)
  Given I am on the login page
  When I fill in email with ‘sara.alexander@therewithcare.org’
  And I fill in password with ‘imcool’
  And I press 'login'
  Then I should be on Login
  And I should see "Invalid Credentials"

Scenario: login success
  # Login Success
  Given I am on the login page
  When I fill in email with ‘donaldchen@berkeley.edu’
  And I fill in password with ‘imnotsara’
  And I press login
  Then I should be on Index







