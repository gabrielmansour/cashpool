When /^I enter a name$/ do
  fill_in :name, with: "Rehearsals coached by Kirsten"
end

Then /^I should see the group's name$/ do
  page.should have_content("Rehearsals coached by Kirsten")
end

Then /^I should see that I am the creator of the group$/ do
  find("#creator").should have_content("created by Wilfred Laurier")
end

Then /^the payment due is (\$0)$/ do |amount|
  find("#payment_due").text.strip.should == amount
end

Then /^I should be on the group's page$/ do
  current_path.should == group_path(Group.last) # TODO make less dependent on the db
end

Given /^a group exists$/ do
  @group = create(:group)
end

When /^I invite a friend to the group$/ do
  visit group_path(@group)
  click_link "Edit Group"
  click_link "Invite Friends"

  # simulate fb app request submission since it's in an iframe and capybara-webkit doesn't have very good iframe support:
  page.driver.evaluate_script(%{ Cashpool.add_members([627395206]) })
end

Then /^he should be marked as pending$/ do
  find('#members > li:contains("Gabriel Mansour")').should have_css(".pending")
  find('#members > li:contains("Gabriel Mansour") .pending').text.strip.should == "pending"
end

Then /^he should not be marked as pending$/ do
  find('#members > li:contains("Gabriel Mansour")').should_not have_css(".pending")
  find('#members > li:contains("Gabriel Mansour")').should_not have_content("pending")
end

Then /^he should be a member of the group$/ do
  visit group_path(@group)
  find("#members > li").should have_content("Gabriel Mansour")
  find("#members > li")['title'].should == "added by Wilfred Laurier"
  all("#members > li").size.should == 1
end

Given /^a friend has been invited$/ do
  step "I invite a friend to the group"
end

Then /^he should have a balance of (\$\d+)$/ do |amount|
  find('#members > li:contains("Gabriel Mansour") .balance').text.strip.should == amount
end

