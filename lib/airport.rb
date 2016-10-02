require_relative 'plane'
require_relative 'weather'

class Airport
	
	DEFAULT_CAPACITY = 21

	attr_reader :landed_planes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@landed_planes = []
		@capacity = capacity
	end

	def land(plane)
		plane.land
		@landed_planes << plane
	end

	def take_off(plane)
		plane.take_off
		@landed_planes.delete(plane)
	end

	def full?
		true if @landed_planes.count >= @capacity
	end

end