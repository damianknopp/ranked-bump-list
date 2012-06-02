# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Ranked.delete_all

max = 100
day = 6
ranks = []
bump_value = nil
0.upto(day) do |day|
	ranks[day] = []
	my_rand = (1..max).to_a.shuffle
	1.upto(max) do |i|
		if day >= 1
			old_rank = ranks[day - 1][i-1]
#			bump_value = old_rank.ranking
			bump_value = my_rand.at(0)
			#is the rank still available, and is it reasonable? ie in a 30% range of the old value
			if(my_rand.any? { |e| e == old_rank.ranking } && (((bump_value - old_rank.ranking).abs)%100) <= 30)
				bump_value = old_rank.ranking
				my_rand.delete(old_rank.ranking)
			else
				bump_value = my_rand.pop
			end
		else
			bump_value = my_rand.pop
		end

#		if(day != 0)
#			old_rank = ranks[day - 1][i-1]
#			bump_value = my_rand.at(0)
			#is the rank still available, and is it reasonable? ie in a 30% range of the old value
#			if(my_rand.any? { |e| e == old_rank.ranking } && (((bump_value - old_rank.ranking).abs)%100) >= 30)
#				bump_value = old_rank.ranking
#				my_rand.delete(old_rank.ranking)
#			else
#				bump_value = my_rand.pop
#			end
#		else
#			bump_value = my_rand.pop
#		end

		r =	Ranked.create(:item_name => "item#{i}", :ranking => bump_value, :day => day)
		ranks[day][i-1] = r
		end
	end
#end