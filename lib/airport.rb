class Airport
	DEFAULT_CAPACITY = 10

	attr_reader :planes, :capacity

	def initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def plane_landed plane
		@planes << plane
	end

	def full?
		@planes.length >= @capacity ? true : false 
	end
end
