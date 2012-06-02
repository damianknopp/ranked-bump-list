class Ranked < ActiveRecord::Base
	set_table_name "ranked"

	def to_s
		"#{item_name} @ rank #{ranking}"
	end
end
