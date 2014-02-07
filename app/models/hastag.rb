class Hastag < ActiveRecord::Base
   attr_accessible :photo_id, :tag_id
   validates :photo_id, uniqueness: true, presence: true
   belongs_to :photo
   belongs_to :tag
end
