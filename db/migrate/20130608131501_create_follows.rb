class CreateFollows < ActiveRecord::Migration
 	def change
  		# drop_table :follows
    	create_table :follows do |t|
      		t.integer :follower_id
      		t.integer :followed_id
      		t.timestamps
    	end
  	end
end