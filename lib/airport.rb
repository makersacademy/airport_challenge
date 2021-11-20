require_relative 'plane.rb'

class Airport
	attr_reader :capacity
	DEFAULT_CAPACITY = 1
	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@hangar = []
	end

	def land(plane)
		raise "Airport full" if @hangar.size == @capacity
		@hangar.push(plane)
	end

	def take_off
		@hangar.pop
		"Plane successfully departed."
	end


end

# jfk = Airport.new
# p jfk
# plane = Plane.new
# p plane
# plane.land