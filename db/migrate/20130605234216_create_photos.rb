class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
  	# drop_table :photos
      t.string :detail
      t.integer :user_id
      t.string :image
      t.timestamps
    end
  end
end