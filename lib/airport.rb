require_relative 'plane'


class Airport

	def initialize(capacity)
		@capacity = capacity
		@planes = []
	end

	def land(plane)  
		raise 'Cannot land plane: airport full.  Take off a plane first.' if full?
		raise 'Cannot land plane: weather is stormy' if stormy?
		@planes << plane
	end

	def planes_landed  
		@planes
	end

	# def taken_off(plane)
	# 	@planes.pop
	# end

	private

	def full?
	@planes.length >= @capacity
	end

	def stormy?
		rand(1..6) > 4  #logic to these number choices...?  
	end
end

# tried to incorporate planes_landed into land, so a plane lands, put plane in array, return array, but it didn't like it, so created separate method to return value of array?
# to access @planes --> need another method planes_landed, why can't return value in land method?  


















