require_relative 'plane'

class Airport

	attr_reader :capacity , :planes

	DEFAULT_CAPACITY = 100

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		fail 'airport is full' if planes.count == @capacity
		plane.landed
		@planes << plane
	end

	def takeoff(plane)
		fail 'no planes to take off' if @planes.empty?
		@planes.delete(plane)
		plane.taken_off
		plane
	end

end
