#require_relative 'airport'

class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land airport
		fail 'Not an airport' unless airport.is_a?(Airport)
		@flying = false
	end

	def take_off
		fail "Can't take off while already flying" if @flying
		@flying = true
	end

end


