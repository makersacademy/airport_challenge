require_relative 'plane'

class Airport

	attr_reader :planes

	def initialize
		@landed_planes = []
	end

	def land(plane)
		@landed_planes << plane 
	end

	# def takeoff(plane)
	# 	@landed_planes.pop
	# end

end
