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
end
