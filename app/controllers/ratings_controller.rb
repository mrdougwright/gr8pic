class RatingsController < ApplicationController
  def index
    @winning_photo = Rating.winner
    @winning_user = User.find(@winning_photo.user_id).name
  end


  def create
    @rating = Rating.new(params[:rating].merge({:user_id => current_user.id}))
    
    if @rating.save
      redirect_to :back
    else
      render "new"
    end
  end

  def new

    unless current_user.nil?
      @photo = Rating.unrated(current_user.id)
    else
      @photo = Photo.all.sample
    end

    @rating = Rating.new
  end

end
