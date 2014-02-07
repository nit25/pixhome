class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :photo_id, :content
  validates :user_id, presence: true
  validates :photo_id, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :photo
end