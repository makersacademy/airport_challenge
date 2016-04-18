require_relative 'plane'
require_relative 'weather'

class Airport

	attr_reader :capacity , :planes

	DEFAULT_CAPACITY = 100

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		fail "airport is full" if planes.count == @capacity
		fail "plane has already landed" if plane.airborne == false
		plane.landed
		@planes << plane
	end

	def takeoff(plane)
		fail "no planes to take off" if @planes.empty?
		fail "plane has already taken off" if plane.airborne
		fail "plane is not at this airport" unless @planes.include? plane
		@planes.delete(plane)
		plane.taken_off
		plane
	end

end
