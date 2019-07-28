require_relative 'plane'

class Airport
	def initialize
		@planes = []
	end

	def land(plane)
		fail 'Airport full' if @planes.count >= 20
    	@planes << plane
	end

	def take_off(plane)
		@planes.pop
	end

end