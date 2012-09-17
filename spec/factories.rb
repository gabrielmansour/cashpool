FactoryGirl.define do
  factory :user do
    first_name "Robertson"
    last_name  "Davies"
    sequence :facebook_id
  end

  factory :group do
    name "Coconut Water stash"
  end

  factory :membership do
    facebook_id "12345"
    association :inviter, factory: :user
    group
  end
end
