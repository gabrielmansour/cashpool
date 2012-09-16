class User < ActiveRecord::Base
  devise :omniauthable, :trackable

  attr_accessible :email_address


  def self.find_from_omniauth(auth_data)
    find_by_facebook_id(auth_data['uid'])
  end

  def self.create_from_omniauth(auth_data)
    create! do |u|
      u.facebook_id = auth_data['uid']
      u.first_name = auth_data['info']['first_name']
      u.last_name = auth_data['info']['last_name']
      u.email_address = auth_data['info']['email']
    end
  end

  def name
    [first_name, last_name].join ' '
  end
  alias_method :to_s, :name
end
