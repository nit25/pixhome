class Follow < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :follower_id, :followed_id
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  def getfollower
  		return User.find_by_id(follower_id)	
  end
  def getfollowed
  		return User.find_by_id(followed_id)	
  end
end