class AddRatingsTotalToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :ratings_total, :float
  end
end
