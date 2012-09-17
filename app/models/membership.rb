class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :inviter, class_name: "User"

  def user
    @user ||= User.where(facebook_id: facebook_id).first_or_initialize do |user|
      user_data = HTTParty.get("http://graph.facebook.com/#{facebook_id}"){ |data| data }
      user.first_name = user_data["first_name"]
      user.last_name = user_data["last_name"]
    end
  end
  
  def pending?
    user.new_record?
  end
end
