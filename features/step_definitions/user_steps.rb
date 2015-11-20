Given /^I am on the weRwics home page$/ do
  visit users_path
 end


 When /^I have added a profile with name "(.*?)" and state "(.*?)" and city "(.*?)" and profession "(.*?)" and description  "(.*?)" $/ do |name, state, city, profession, description|
  visit new_user_path
  fill_in 'Name', :with => name
  select state, :from => 'State'
  fill_in 'City', :with => city
  select profession, :from => 'Profession'
  fill_in 'Description', :with => description
  click_button 'Create User'
 end

 Then /^I should see a user with name "(.*?)"$/ do |name| 
   result=false
   
   expect(result).to be_truthy
 end
 
  When /^I have added a blog with title "(.*?)" and content "(.*?)"$/ do |title, content|
  visit new_user_blog_path
  fill_in 'Title', :with => title
  fill_in 'Content', :with => content
  click_button 'Save'
 end
 
 Then /^I should see a blog list entry with title "(.*?)"$/ do |title| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
 end
 
 Given /^I have added a blog with title "(.*?)" and content "(.*?)"$/ do |title, content|
  visit new_user_blog_path
  fill_in 'Title', :with => title
  fill_in 'Content', :with => content
  click_button 'Save'
 end
 
 And /^I have visited the "(.*?)" details page$/ do |title| 
    visit user_blog_path
    click_on "#{title}"
 end
 
 When /^I have edited the blog "(.*?)" to change the title to "(.*?)"$/ do |title1,title2|
  click_on "Edit"
  fill_in 'Title', :with => title2
  click_button 'Update'
 end
  
 
 
 
  