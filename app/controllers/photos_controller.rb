class PhotosController < ApplicationController

  before_filter :checklogin

    def checklogin
        if session[:user_id] == nil || session[:user_id] == ""
           redirect_to '/error'
          end
    end

  
  # GET /photos
  # GET /photos.json
  def index
    if session[:user_id] != nil 
         redirect_to '/home'
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @comments = Comment.where(:photo_id => params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = session[:user_id]
    @tagcontent = params[:tag]
    if (@tagcontent!="")
      tag = Tag.find_by_content(@tagcontent)
      if (tag !=nil)
        @tag_id = tag.id
      else
        @newtag = Tag.new
        @newtag.content = @tagcontent
        @newtag.save
        @tag_id = @newtag.id
      end
    end

    respond_to do |format|
      if @photo.save
        if (@tagcontent!="")
            @hastag = Hastag.new
            @hastag.photo_id = @photo.id
            @hastag.tag_id = @tag_id
            @hastag.save
        end
        format.html { redirect_to '/home', notice: 'You have uploaded a new photo'}
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    @photo_oldtag = @photo.gettag
    @tagcontent = params[:tag]
    if @photo.hastag
          if @tagcontent != @photo_oldtag
              @deletehastag = Hastag.find_by_photo_id(@photo.id)
              @deletehastag.destroy
              if (@tagcontent!="")
                  tag = Tag.find_by_content(@tagcontent)
                  if (tag !=nil)
                    @tag_id = tag.id
                  else
                    @newtag = Tag.new
                    @newtag.content = @tagcontent
                    @newtag.save
                    @tag_id = @newtag.id
                    @hastag = Hastag.new
                    @hastag.photo_id = @photo.id
                    @hastag.tag_id = @tag_id
                    @hastag.save
                  end
              end     
          end
         
    else
        if (@tagcontent!="")
            tag = Tag.find_by_content(@tagcontent)
            if (tag !=nil)
              @tag_id = tag.id
            else
              @newtag = Tag.new
              @newtag.content = @tagcontent
              @newtag.save
              @tag_id = @newtag.id
            end
            @hastag = Hastag.new
            @hastag.photo_id = @photo.id
            @hastag.tag_id = @tag_id
            @hastag.save
        end
    end
    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @hastags = Hastag.where(:photo_id => @photo.id)
    @hastags.destroy_all
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to '/home', notice: 'You have deleted the picture' }
      format.json { head :no_content }
    end
  end
end
