class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :photo

      t.timestamps
    end
    add_index :ratings, :photo_id
  end
end
