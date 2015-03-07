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
  When I am on the login page
  Then I should see Username field
  And I should see Password field
  And I should see Login Button

Scenario: login with invalid email
  # Login Fail (1)
  When I am on the login page
  And I enter invalid email ‘d.chen72@gmail.com’
  And I press 'login'
  Then I should see login page
  And I should see login error message 1

Scenario: login with invalid password
  # Login Fail (2)
  When I am on the login page
  And I enter valid email ‘sara.alexander@therewithcare.org ’
  And I enter invalid password ‘imcool’
  And I click login
  Then I should see login
  And I should see login error message 1

Scenario: login success
  # Login Success
  When I visit login page
  And I enter valid email ‘donaldchen@berkeley.edu’
  And I enter valid password ‘imnotsara’
  And I click login
  Then I should go to index







