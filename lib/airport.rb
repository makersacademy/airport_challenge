require_relative 'plane'

class Airport

	def initialize
		@planes = []
	end

	def land plane
		raise 'Aiport full, remain in stack' if full?
		@planes << plane
		plane.land
	end

	def takeoff plane
		@planes.pop
		plane.takeoff
	end
end

private

def full?
	@planes.count >= 7
end





