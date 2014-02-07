class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :password_confirmation, :image

  has_secure_password
  has_many :photo
  has_many :comment

  mount_uploader :image, ImageUploader


  before_validation :convert_email
  #after_save :sendemail

  validates :email, uniqueness: true, presence: true
  validates :email, email_format: {message: "It seems this is not an email address"}
  validates :username, uniqueness: true, presence: true
  validates :image, presence: true

  #def sendemail
  #   UserMailer.firstemail(self.email).deliver
  #end

  def convert_email
      self.email = self.email.downcase
  end


  def pictures
  		return @pictures = Photo.where(:user_id => self.id)
  end
  def caringpictures
      @follows = Follow.select("followed_id").where(:follower_id => self.id)
      @followed_ids = Array.new(@follows.count)
      @followed_ids[0] = self.id
      i = 1
      @follows.each do |f|
          @followed_ids[i] = f.followed_id
          i = i + 1 
      end
      return  Photo.where(:user_id => @followed_ids)
  end
  def followers
      return @followers = Follow.where(:followed_id => self.id)
  end
  def hasFollowedHim(hisid)
      @result = Follow.where(:followed_id => hisid, :follower_id =>self.id)
      if @result.count == 0
        return false
      else
        return true
      end
  end
end
