class CreateRanked < ActiveRecord::Migration
  def self.up
    create_table :ranked do |t|
			t.string :item_name
			t.integer :ranking
			t.integer :day
    end
	   say "created table ranked!"
#	   suppress_messages { add_index :item_name, :ranked }
#	   suppress_messages { add_index :ranking, :ranked }
#		 say "added index too!"
		 c = Ranked.count(:all)
		 say "#{c} items in ranked"
  end

  def self.down
    drop_table :ranked
  end
end
