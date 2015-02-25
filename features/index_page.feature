Feature: choose between document or take out items
	As a logged in user
  I want to chose to store or take out items, manually or non-manually
  So that I can do the correct job

Scenarios: 
  # Not Logged in
  When I am on the index page
  And I am not logged in
  Then I should go to login page
  And I should see login error message 2 

  # Redirect man_store
  When I am on the index page
  And I click Manual Store
  Then I should be redirected to Manual Store Page

  # Redirect non-man_store
  When I am on the index page
  And I click Non-Manual Store
  Then I should be redirected to Non-Manual Store Page

  # Redirect man_store
  When I am on the index page
  And I click Manual Take-out
  Then I should be redirected to Manual Take-out Page

  # Redirect man_store
  When I am on the index page
  And I click Non-Manual Take-out
  Then I should be redirected to Non-Manual Take-out Page

  # Display correctly
  When I am on the index page
  Then I should see Non-Manual Take-out Button
  And I should see Manual Take-out Button
  And I should see Non-Manual Store Button
  And I should see Manual Store Button