Given /^I am signed in to Facebook$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = {
    "uid" => '12345',
    "info" => {
      "first_name" => "Wilfred",
      "last_name" => "Laurier",
      "email" => "wilfrid.laurier@parl.gc.ca"
    }
  }
end

Then /^I should be signed in$/ do
  page.should_not have_css("#login")
  page.should have_css("#current_user")
  find("#current_user").text.strip.should == "Wilfred Laurier"
  page.should have_css("#logout")
end

Then /^I should not be signed in$/ do
  page.should have_css("#login")
  page.should_not have_css("#current_user")
  page.should_not have_css("#logout")
end

Given /^I am signed in$/ do
  step "I am on the home page"
  step "I click the login link"
end

