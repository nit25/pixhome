class PicappController < ApplicationController

	before_filter :checklogin, :only => [:home, :search]

  	def checklogin
    	  if session[:user_id] == nil || session[:user_id] == ""
    	   	   	redirect_to '/error'
      	  end
  	end



	def welcome
	      reset_session
    	  if session[:user_id] != nil 
    	   	   	redirect_to '/home'
      	  end

	end
	def error
	end
	def home
		@user = User.find_by_id(session[:user_id])
		@pictures = @user.caringpictures.order("created_at DESC")
	end
	
	def search
		@user = User.find_by_id(session[:user_id])
		@searchcontent = params[:searchcontent]
		@tags = Tag.all(:conditions => "content LIKE '%#{@searchcontent}%'")	

		@tag_ids = Array.new(@tags.count)
		for i in 0...@tags.count
			@tag_ids[i] = @tags[i].id
		end

		@hastags = Hastag.where(:tag_id => @tag_ids)
		@photo_ids = Array.new(@hastags.count)
		# puts "--------------------------------" + @hastags.count.to_s + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5"

		for i in 0...@hastags.count
			@photo_ids[i] = @hastags[i].photo_id
		end
		@photos1 = Photo.all(:conditions => "detail LIKE '%#{@searchcontent}%'")
		@photos2 = Photo.where(:id => @photo_ids);

		@photos = @photos1 + @photos2

		@users = User.all(:conditions => "username LIKE '%#{@searchcontent}%'")
	end
	# def follow
	# 	@follow = Follow.new
	# 	@follow.follower_id = session[:user_id]
	# 	@follow.followed_id = params[:id]
	# 	if @follow.save
	# 			redirect_to '/users/'+params[:id], notice: 'You have followed this user'
	# 	end
	# end
	# def unfollow
	# 	@follow = Follow.where(:follower_id => session[:user_id], :followed_id => params[:id])
	# 	@follow.destroy_all
	# 	redirect_to '/users/'+params[:id], notice: 'You have unfollowed this user'
	# end
end