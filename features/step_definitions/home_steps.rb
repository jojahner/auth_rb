Given /^I am a guest$/ do
  page.reset_session!
end

Given /^a user with$/ do |table|
  Factory.create(:user, table.hashes.first)
end

When /^I go to root page$/ do
  visit '/'
end

When /^I fill in '(.+)' with '(.+)'$/ do |field, value|
  fill_in field, :with => value
end

When /^I press '(.+)'$/ do |button_title|
  click_button button_title
end

Then /^I should be on my profile page$/ do
  page.current_path.should eql('/users/testuser')
end