When /^I enter a name$/ do
  fill_in :name, with: "Rehearsals coached by Kirsten"
end

Then /^the payment due is (\$0)$/ do |amount|
  find("#payment_due").text.strip.should == amount
end
