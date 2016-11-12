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
	end

end