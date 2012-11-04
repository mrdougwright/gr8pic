class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def create
    unless params[:photo].nil?
      @photo = Photo.create(params[:photo].merge({:user_id => current_user.id}))

      if @photo.save
        redirect_to new_rating_path
      else
        redirect_to new_photo_path
      end
    else
      redirect_to new_photo_path, :notice => "You must choose a photo to upload"
    end
  end

  def new
    @photo = Photo.new
    @user = User.new
  end

  def update
    @photo = Photo.create(params[:photo].merge({:user_id => current_user.id}))

    if @photo.save
      redirect_to ratings_path
    else
      redirect_to new_photo_path
    end
  end

  def destroy
  end

  def show
    @photo = Photo.find(params[:id])
  end
  
end
