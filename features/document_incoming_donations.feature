Feature: document incoming donations
  As the staff
  I want to document incoming donations
  So I can keep track of the flow of donations

Scenarios: 
  # Not Logged in
  When I am on the store page
  And I am not logged in
  Then I should go to login page
  And I should see login error message 2 

  # Correctly display
  When I am on the store page
  Then I should see instructions
  And I should see button with link

  # Login Fail (2)
  When I am on the store page
  And I click button with link
  Then I should go to scanner app