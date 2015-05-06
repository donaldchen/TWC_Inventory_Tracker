Feature: admin_login
  As an administrator at There With Care
  I want to login with administrator privileges
  So that I can carry out administrative tasks
  
Background:
  
  Given the following users exist:
  | user_name					                | password      | admin?   |
  | test1@test1.com                   | test1  		    | N        |
  | testadmin@testadmin.com           | testadmin     | Y        |
  
  Given I am on the login page
  
Scenario: Successful admin login
  When I fill in "email" with "testadmin@testadmin.com"
  And I fill in "password" with "testadmin"
  And I press "Login"
  Then I should see "Analytics"
  
Scenario: Non-admin login
  When I fill in "email" with "test1@test1.com"
  And I fill in "password" with "test1"
  And I press "Login"
  Then I should not see "Analytics"
  
Scenario: Non-admin cannot access analytics page
  When I fill in "email" with "test1@test1.com"
  And I fill in "password" with "test1"
  And I press "Login"
  And I go to the Analytics page
  Then I should see "Only admins can access Analytics"
  