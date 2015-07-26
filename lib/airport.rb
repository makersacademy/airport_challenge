
class Airport

DEFAULT = 1

	def initialize
		@capacity = DEFAULT
		@planes = []
		@weather = true
	end

	def capacity
		@capacity
	end

	def plane_in plane
		if (@planes.size >= @capacity) || (self.weather_state == false)
			#fail "No more space at the airport"
			false
		 else 
		 	@planes << plane
		 	true
		 end
	end

	def plane_out plane 

		if self.weather_state 
			@planes.delete(plane)
			return true
		else
			return false
		end
	end

	def plane_size
		@planes.size
	end

	def weather_state
	end


end

