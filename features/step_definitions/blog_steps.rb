Given(/^I have logged in as user "(\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z?i)" with password "(.*?)"$/) do |email, pword|
    visit users_path
    click_button 'Login/Sign up'
    click_link 'Login'
    fill_in 'Email', :with => email
    fill_in 'Password', :with => pword
    click_button 'Login'
end 
 
When(/^I have created a blog with title "(.*?)" and content "(.*?)"$/) do |title, content|
  #visit user_path
  click_link 'user3@email.com'
  click_button 'New Blog'
  #visit new_user_blog_path
  fill_in 'Title', :with => title
  fill_in 'Content', :with => content
  click_button 'Save'
end
 
Then(/^I should see a blog list entry with title "(.*?)"$/) do |title| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
end
 
Given(/^I have added a blog with title "(.*?)" and content "(.*?)"$/) do |title, content|
  visit new_user_blog_path
  fill_in 'Title', :with => title
  fill_in 'Content', :with => content
  click_button 'Save'
end
 
And(/^I have visited the "(.*?)" details page$/) do |title| 
    visit user_blog_path
    click_on "#{title}"
end
 
When(/^I have edited the blog "(.*?)" to change the title to "(.*?)"$/) do |title1,title2|
  click_on "Edit"
  fill_in 'Title', :with => title2
  click_button 'Update'
end