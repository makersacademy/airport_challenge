require_relative 'plane'

class Airport
	def land(plane)
		"#{plane} has landed"
	end

	def take_off(plane)
		"#{plane} has taken off and left the airport"
	end
end