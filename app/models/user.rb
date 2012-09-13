class User < ActiveRecord::Base
  devise :omniauthable, :trackable

  attr_accessible :email_address


  def self.find_from_omniauth(auth_data)
    find_by_facebook_id(auth_data['uid'])
  end

  def self.create_from_omniauth(auth_data)
    create! do |u| 
      u.facebook_id = 1
      u.first_name = "Wilfred"
      u.last_name = "Laurier"
    end
    # TODO make dynamic
  end
end
