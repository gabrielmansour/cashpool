FactoryGirl.define do
  factory :user do
    first_name "Robertson"
    last_name  "Davies"
    sequence :facebook_id
  end
end
