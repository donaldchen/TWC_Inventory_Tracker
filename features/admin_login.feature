Feature: admin_login
  As an administrator at There With Care
  I want to login with adminstrator priveleges
  So that I can carry out administrative tasks
  
Background:
  
  Given the following non-admin users exist:
  | user_name					                | password      | admin?   |
  | test1@test1.com                   | test1  		    | N        |
  | testadmin@testadmin.com           | testadmin     | Y        |
  
  Given I am on the login page
  
Scenario: Successful admin login
  When I fill in "email" with "testadmin@testadmin.com"
  And I fill in "password" with "testadmin"
  And I press "Sign in"
  Then I should see analytics button
  
Scenario: Non-admin login
  When I fill in "email" with "test1@test1.com"
  And I fill in "password" with "test1"
  And I press "Sign in"
  Then I should not see analytics button
  
Scenario: Non-admin cannot access analytics page
  When I fill in "email" with "test1@test1.com"
  And I fill in "password" with "test1"
  And I press "Sign in"
  And I go to the Analytics Page
  Then I should see "only admins can access analytics"
  