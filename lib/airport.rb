require_relative 'plane'

class Airport
	def initialize
		@planes = []
	end

	def land plane
		@planes << plane
		plane.land
	end

	def takeoff plane
		@planes.pop
		plane.takeoff
	end
end



