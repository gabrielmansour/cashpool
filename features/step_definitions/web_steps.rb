Given /^I (?:am on|go to) the (.+) page$/ do |page_name|
  visit path_to(page_name)
end

When /^I click the (.+) link$/ do |link_name|
  click_link link_name
end

When /^I press "([^"]*)"$/ do |button|
  click_button button
end

Then /^I should be on the group's page$/ do
  current_path.should == group_path(Group.last) # TODO make less dependent on the db
end
