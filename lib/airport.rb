class Airport

	DEFAULT_CAPACITY = 1

	attr_accessor :capacity, :planes_on_the_ground, :planes_in_the_sky

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes_in_the_sky = []
		@planes_on_the_ground = []
	end

	def maximum_capacity?
	end

	def takeoff?
	end

	def land(plane)
		@planes_on_the_ground << plane
	end

end
