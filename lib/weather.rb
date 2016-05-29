require 'faker'

module Weather

	def Weather.good_forecast?
		# true ratio is 0.7 (often true)
		Faker::Boolean.boolean(0.7) 
	end

end 