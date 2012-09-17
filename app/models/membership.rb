class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :inviter, class_name: "User"

  validates :group_id, presence: true
  validates :facebook_id, presence: true, numericality: true, uniqueness: {scope: :group_id}
  validates :inviter_id, presence: true

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
