Feature: edit an existing profile

Scenario: Edit a profile from the weRwics App

 Given I have added a profile with name "Ted Willow" and description "Hi, I am Ted"
 And I have visited the Details about "Ted Willow" page

 When I have edited the profile "Ted Willow" to change the description to "Hi, you"
 And I am on the wics home page
 Then I should see a  list entry with title "Ted Willow" and description "Hi, you"