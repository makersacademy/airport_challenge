class Airport
	
	DEFAULT_CAPACITY = 21

	attr_reader :landed_planes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@landed_planes = []
		@capacity = capacity
	end

	def land(plane)
		@landed_planes << plane
	end

	def full?
		true if @landed_planes.count >= @capacity
	end

end