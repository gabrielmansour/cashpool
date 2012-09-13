require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  describe "#name" do
    it "should be a concatenation of the first name and the last name" do
      user.name.should == "Robertson Davies"
    end
  end

  describe ".create_from_omniauth" do
    let(:auth_data) do
      { 
        'provider' => 'facebook',
        'uid' => '1254',
        'info' => {
          'first_name' => "Robinson",
          "last_name" => "Crusoe",
          "email" => "wilson@example.com"
        }
      }
    end
    subject { User.create_from_omniauth(auth_data) }

    it "should create a User in the db" do
      expect{ subject }.to change(User, :count).from(0).to(1)
    end
    it  { should be_a(User) }
    its(:facebook_id){ should == "1254" }
    its(:first_name) { should == "Robinson" }
    its(:last_name)  { should == "Crusoe" }
    its(:email_address) { should == "wilson@example.com" }
    its(:persisted?) { should == true }
  end
end
