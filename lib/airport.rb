class Airport
	attr_reader :capacity, :planes_array
	DEFAULT_CAPACITY = 50

	
	def initialize
		@capacity = DEFAULT_CAPACITY
		@planes_array = [] # we can hold 50 planes in this array	
	end

	def host(plane)
		fail "The airport is full" if @planes_array.length >= capacity
		plane.land
		@planes_array << plane
	end
end