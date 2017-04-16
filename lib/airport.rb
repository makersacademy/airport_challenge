require_relative 'plane'

class Airport

	attr_reader :planes

	def initialize
		@planes = []
	end

	def takeoff(plane)
		plane.tookoff
	end

	def land(plane)

		plane.landed
	end

end