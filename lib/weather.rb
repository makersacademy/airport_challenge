require 'faker'

module Weather

	def good_forecast?
		# true ratio is 0.7 (often true)
		Faker::Boolean.boolean(0.7) 
	end

end 