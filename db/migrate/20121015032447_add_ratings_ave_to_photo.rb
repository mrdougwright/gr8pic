class AddRatingsAveToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :ratings_ave, :float
  end
end
