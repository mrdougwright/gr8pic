class ChangeColumnToDecimalinPhotos < ActiveRecord::Migration
  def change
  	change_column :photos, :ratings_ave, :decimal, :precision => 10, :scale => 9
  end
end
