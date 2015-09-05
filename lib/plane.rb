require_relative 'airport'

class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land airport
		fail 'Not an airport' unless airport.is_a?(Airport)
		fail "Can't land in stormy weather" if airport.is_stormy?
		fail "Can't land at a full airport" if airport.is_full?
		@flying = false
	end

	def take_off
		@flying = true
	end

	private

end


