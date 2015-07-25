class Airport

	attr_reader :planes

	def initialize 
		@planes = []
	end

	def land_plane(plane)
		plane.land(self)
		@planes << plane 
		return
	end

end
