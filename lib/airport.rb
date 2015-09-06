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

	def plane_taken_off plane
		@planes.delete(plane) 
	end

	def full?
		@planes.length >= @capacity ? true : false 
	end

	def weather
		rand(0..1) == 0 ? 'sunny' : 'stormy'
	end
end
