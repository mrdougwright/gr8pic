class Rating < ActiveRecord::Base
  attr_accessible :value, :photo_id, :user_id

  belongs_to :photo
  belongs_to :user

  private
  after_save :recalculate_photo


  def recalculate_photo
    photo.update_photo_ratings if photo
  end

  def self.unrated(current_user_id)
    return_val = nil
    every_photo = []
    user_ratings = Rating.where(:user_id => current_user_id).each
    for photo in user_ratings
      every_photo << photo.photo_id
    end

    for id in (1..Photo.count)
      if every_photo.include?(id) == false
        return_val = Photo.find(id)
      end
    end
    return_val
  end

  def self.winner  #PROBLEM --> what about ties?
    best_photo = Photo.maximum("ratings_ave")
    Photo.where(:ratings_ave => best_photo).first
  end
	
end
