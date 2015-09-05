require_relative 'airport'

class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land airport
		fail 'Not an airport' if airport.is_a?(Airport) == false
		@flying = false
	end

	def take_off
		@flying = true
	end

end

# ap = Airport.new
# p ap.is_a?(Airport)