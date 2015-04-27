Feature: login page
  As a volunteer or staff
  I want to login
  So I can carry out my job with security

Background: movies have been added to database

  Given the following users exist:
  | user_name					                | password      |
  | test1@test1.com                  	| test1  		    |	

Scenario: display login page
  # Login Visit
  Given I am on the login page
  Then I should see "Email"
  And I should see "Password"
  And I should see "Login"

Scenario: login with invalid email
  # Login Fail (1)
  Given I am on the login page
  When I fill in "email" with "d.chen72@gmail.com"
  And I fill in "password" with "imnotsara"
  And I press "Login"
  And I should see "Login not Successful"

Scenario: login with invalid password
  # Login Fail (2)
  Given I am on the login page
  When I fill in "email" with "test1@test1.com"
  And I fill in "password" with "imcool"
  And I press "Login"
  And I should see "Login not Successful"

Scenario: login success
  # Login Success
  Given I am on the login page
  When I fill in "email" with "test1@test1.com"
  And I fill in "password" with "test1"
  And I press "Login"
  Then I should see "Login Successful"







