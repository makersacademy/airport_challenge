
class Airport

DEFAULT = 1

	def initialize
		@capacity = DEFAULT
		@planes = []
	end

	def capacity
		@capacity
	end

	def plane_in plane
		if @planes.size >= @capacity
			#fail "No more space at the airport"
			false
		 else 
		 	@planes << plane
		 	true
		 end
	end

	def plane_out 
		@planes.pop
	end

	def plane_size
		@planes.size
	end

end

