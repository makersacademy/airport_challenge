require_relative 'plane'

class Airport

	attr_reader :capacity , :planes

	DEFAULT_CAPACITY = 100

	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end

	def land(plane)
		fail "airport is full" if planes.count == @capacity
		fail "plane has already landed" if @planes.include? plane
		plane.landed
		@planes << plane
	end

	def takeoff(plane)
		fail "no planes to take off" if @planes.empty?
		fail "plane has already taken off" unless @planes.include? plane
		@planes.delete(plane)
		plane.taken_off
		plane
	end

end
