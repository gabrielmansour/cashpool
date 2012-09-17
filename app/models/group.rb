class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :memberships
  belongs_to :creator, class_name: "User"
  
  validates :name, :creator_id,  presence: true
end
