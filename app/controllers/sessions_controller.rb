class SessionsController < ApplicationController
  def new
      @tips=""
      if session[:user_id] != nil 
         redirect_to '/home'
      end
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_url
      # notice: 'Signed in successfully.'
    else
      @tips="Information not correct!"
      render 'new'
      # notice: 'Information not correct!'
    end
  end

  def destroy
    reset_session
    redirect_to welcome_url
  end
end