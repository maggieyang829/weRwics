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