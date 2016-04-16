class Airport

	attr_reader :landed

	def initialize
		@landed = []
	end

	def receive(plane)
		if plane.stormy?
			plane.land_fails("weather")
		else
			@landed << plane
			plane.land(self)
		end
	end

end