
require_relative 'plane'

class Airport

	def land(plane)
		@plane = plane
		"Plane has landed"
	end

	def take_off
		@plane = nil
		@plane
	end

	def full?
		if @plane == nil
			false
		else
			true
		end
	end

end