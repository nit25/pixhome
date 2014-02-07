class CommentsController < ApplicationController

	before_filter :checklogin

	  def checklogin
    	  if session[:user_id] == nil || session[:user_id] == ""
       	   redirect_to '/error'
      	  end
  	end
	
	def new
		
		@photo_id = params[:id]
		@user_id = session[:user_id]
		if params[:commentcontent] == ""
			redirect_to '/photos/'+@photo_id.to_s
		end
		@comment = Comment.new
		@comment.user_id = @user_id
		@comment.photo_id = @photo_id
		@comment.content = params[:commentcontent]

		if @comment.save
			redirect_to '/photos/'+@photo_id.to_s, notice: "Comment has been made"
		end
	end
end
