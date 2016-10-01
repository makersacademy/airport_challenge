require 'plane'

class Airport

	def land(plane)
		@land = plane
	end 

	def take_off
		@plane_departed = false

	end 

end 