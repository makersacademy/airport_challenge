require './lib/plane'

class Airport

AIRPORT_CAPACITY = 20

	def initialize(options = {})
		@capacity = options.fetch(:capacity, AIRPORT_CAPACITY)
		@planes = []
	end

	def count_plane
		@planes.count
	end

	def land(plane)
		fail 'does not let plane land' if full?
		plane.land?
		@planes << plane
	end

	def full?
		count_plane == @capacity
	end	
end