require_relative 'plane'

class Airport

attr_reader :planes

	def initialize
		@planes = []
	end

	def land(plane)
		plane.landed
		@planes << plane
	end

	def takeoff(plane)
		plane.depart
		@planes.delete(plane)
	end
end
