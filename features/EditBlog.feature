Feature: A logged in user can edit a blog she created
    As a logged in user
    I want to edit my blog
    so that I can make corrections
    
Background: User has logged into the app
  Given I have logged in as user "user3@email.com" with password "user3pwd"
  And  I am on the home page
    
Scenario: Clicking on Edit link to edit a pre existing blog 
  Given I have added a blog with title "SELT01" and content "SELT01 Content"
  And I have visited the "SELT01" details page 
  When I have edited the blog "SELT01" to change the title to "SELT02"
  And I am on my Profile page 
  Then I should see a blog list entry with title "SELT02" 
    
