class Airport

	attr_reader :landed

	def initialize
		@landed = []
	end

	def receive(plane)
		@landed << plane
		plane.land(self)
	end

end