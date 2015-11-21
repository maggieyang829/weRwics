Feature: Allow weRwics logged in user to add a new profile

Scenario:  Add a new profile (Declarative)
  When I have added a profile with name "Amy Beck" and state "Iowa" and city "Iowa City" and profession "Student" and description "r"
  And I am on the weRwics home page  
  Then I should see a user with name "Amy Beck"