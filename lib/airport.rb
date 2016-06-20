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

	def taking_off(plane)
		fail 'no planes available' if empty?
		plane.flying?
		@planes.pop
	end

	private
	attr_reader :planes

	def full?
		count_plane == @capacity
	end

	def empty?
		@planes.empty?
	end	
end