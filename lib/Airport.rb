class Airport

	attr_reader :planes, :capacity
	DEFAULT_CAPACITY = 100

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land_a(plane)
		@planes << plane
	end

	def full?
		@planes.count >= capacity
	end
end
