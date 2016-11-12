class Airport

	attr_reader :planes

	def initialize
		@planes = []
	end

	def land(plane)
		@planes << plane
		"#{plane} has landed."
	end

	def take_off(plane)
		plane_index = @planes.index(plane)
		@planes.slice!(plane_index)
		"#{plane} has left the airport."
	end

end