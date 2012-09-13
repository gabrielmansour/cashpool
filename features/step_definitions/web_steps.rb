Given /^I am on the (.+) page$/ do |page_name|
  visit path_to(page_name)
end

When /^I click the (.+) link$/ do |link_name|
  click_link link_name
end


