Feature: A logged in user can create blog
    As a logged in user
    I want to create a new blog
    so that I can show my story
    
Scenario:  Clicking on New Blog Button to create a new blog
    When I have added a blog with title "SELT" and content "SELT Project"
    And I am on my Profile page 
    Then I should see a blog list entry with title "SELT" 
