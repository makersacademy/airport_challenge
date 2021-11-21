require_relative 'plane.rb'

class Airport
	attr_reader :capacity, :hangar
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

# use a random number generator to set the weather