require 'spec_helper'

describe Membership do
  let(:membership){ FactoryGirl.create(:membership, facebook_id: "627395206") }
  describe "#user" do
    context "user exists in database" do
      before { @user = FactoryGirl.create(:user, facebook_id: "627395206") }

      it "should fetch the existing user from the db" do
        membership.user.should === @user
        membership.user.persisted?.should == true
      end
    end

    context "user does not exist in the database" do
      it "should not add a user to the database" do
        expect{ membership }.to_not change(User, :count)
        membership.user.persisted?.should == false
      end

      it "should load user attributes from Facebook graph" do
        membership.user.first_name.should == "Gabriel"
        membership.user.last_name.should == "Mansour"
        membership.user.name.should == "Gabriel Mansour"
        membership.user.facebook_id.should == "627395206"
      end
    end
  end
end
