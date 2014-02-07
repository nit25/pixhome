class CreateHastags < ActiveRecord::Migration
  def change
    create_table :hastags do |t|
    	t.integer :photo_id
    	t.integer :tag_id
      	t.timestamps
    end
  end
end
