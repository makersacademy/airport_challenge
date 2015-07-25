
class Airport

DEFAULT = 1

	def initialize
		@capacity = DEFAULT
		@planes = []
	end

	def permission_fly?
		
	end

	def permission_land?
		
	end

	def capacity
		@capacity
	end

	def plane_in plane
		if @planes.size >= @capacity
			fail "No more space at the airport"
		 else 
		 	@planes << plane
		 end
	end

	def plane_size
		@planes.size
	end

end

