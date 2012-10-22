class PhotosController < ApplicationController

  def index
    @photo = Photo.random
    @rating = Rating.new 
  end

  def create
    @photo = Photo.create(params[:photo].merge({:user_id => current_user.id}))

    if @photo.save
      redirect_to new_rating_path
    else
      render :edit
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
    @photo = Photo.last
  end
  
end
