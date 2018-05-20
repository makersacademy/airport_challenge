class Airport

	DEFAULT_CAPACITY = 5

	attr_accessor :capacity, :planes_on_the_ground, :planes_in_the_sky

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes_in_the_sky = []
		@planes_on_the_ground = []
	end

	def maximum_capacity?
		@planes_on_the_ground.count >= @capacity
	end

	def takeoff
		# Take a plane from the front of :planes_on_ground queue
		# and place it at the end of the :planes_in_the_sky queue
		@planes_in_the_sky << @planes_on_the_ground.first
		@planes_on_the_ground.delete_at(0)
	end

	def safe_to_takeoff?


	end

	def land(plane)
		fail 'No apron slots available' if maximum_capacity?
		@planes_on_the_ground << plane
	end

end
