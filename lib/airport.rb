require_relative 'plane'


class Airport

	def initialize
		@planes = []
	end

	def land(plane)  
		@planes << plane
	end

# tried to incorporate planes_landed into land, so a plane lands, put plane in array, return array, but it didn't like it, so created separate method to return value of array?

	def planes_landed  
		@planes
	end

	def taken_off(plane)
		@planes.pop
	end
end

# to access @planes --> need another method planes_landed, why can't return value in land method?  


















