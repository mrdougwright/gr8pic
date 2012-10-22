class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.datetime :date
      t.integer  :user_id

      t.timestamps
    end
  end
end
