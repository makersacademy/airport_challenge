require_relative 'plane'

class Airport 
	def land(plane)
		plane.landed?
	end

	def take_off(plane)
		plane.landed? false
	end

end