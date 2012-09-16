When /^I enter a name$/ do
  fill_in :name, with: "Rehearsals coached by Kirsten"
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

Then /^my friend should be on the pending user list$/ do
  find("#pending_members > li").should have_content("Gabriel Mansour")
  find("#pending_members > li")['title'].should == "added by Wilfred Laurier"
  all("#pending_members > li").size.should == 1
end

