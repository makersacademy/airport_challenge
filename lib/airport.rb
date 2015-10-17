require_relative 'plane'

class Airport
	attr_reader :capacity, :planes_array
	DEFAULT_CAPACITY = 50

	
	def initialize
		@capacity = DEFAULT_CAPACITY
		@planes_array = [] # we can hold 50 planes in this array	
	end

	def land(plane)
		fail "The airport is full" if @planes_array.length >= capacity
		@planes_array << plane
	end

	def take_off
		planes_array.pop
	end
end