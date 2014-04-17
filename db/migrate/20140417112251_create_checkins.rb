class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
