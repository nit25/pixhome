class Tag < ActiveRecord::Base
   attr_accessible :content
	  validates :content, uniqueness: true, presence: true
end
