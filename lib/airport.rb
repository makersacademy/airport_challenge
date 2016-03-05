require_relative 'plane'

class Airport

	attr_reader :capacity , :planes

	DEFAULT_CAPACITY = 100

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		raise 'airport is full' if planes.count == @capacity
		plane.has_landed
		@planes << plane
	end

	def takeoff(plane)
		raise 'no planes to take off' if @planes.empty?
		@planes.delete(plane)
		plane.has_taken_off
		return plane
	end

end
