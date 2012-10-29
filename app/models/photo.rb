class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_attached_file :image, 
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml"
    :styles => {
    :thumb => "100x100#",
    :small => "150x150>",
    :medium => "300x300>",
    :large => "400x400>"},
    :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"}
    }

  def update_photo_ratings
    #This query may need work later. At large scale, the last photo id may
    #not be the same one user rated. Change to find Rating.value based on user_id on rating.
    self.ratings_total += Rating.where(:photo_id => self).last.value
    self.ratings_count += 1
    self.ratings_ave = self.ratings_total / self.ratings_count
    self.save!
  end  
  
end
