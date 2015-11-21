Given(/^I am on the weRwics home page$/) do
  visit users_path
 end

 When(/^I have added a profile with name "(.*?)" and state "(.*?)" and city "(.*?)" and profession "(.*?)" and description "(.*?)"$/) do |name, state, city, profession, description|
  visit new_user_path
  fill_in 'name', :with => name
  select state, :from => 'state'
  fill_in 'city', :with => city
  select profession, :from => 'profession'
  fill_in 'description', :with => description
  click_button 'Create User'
 end

 Then(/^I should see a user with name "(.*?)"$/) do |name| 
  visit users_path
  page.has_content?(name)

 end


Given(/^I have visited the Details about "(.*?)" page$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I have edited the profile "(.*?)" to change the description to "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I am on the wics home page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a  list entry with title "(.*?)" and description "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end