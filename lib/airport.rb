class Airport

	def land(plane)
		@plane = plane
	end

	def take_off(plane)
		@plane = plane
	end

	attr_reader :plane

end