class Rating < ActiveRecord::Base
  attr_accessible :value, :photo_id, :user_id

  belongs_to :photo
  belongs_to :user

  private
  after_save :recalculate_photo


  def recalculate_photo
    photo.update_photo_ratings if photo
  end


  def self.winner  #PROBLEM --> what about ties?
    best_photo = Photo.maximum("ratings_ave")
    Photo.where(:ratings_ave => best_photo).first
  end
	
end
