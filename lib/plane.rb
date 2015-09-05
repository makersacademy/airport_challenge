#require_relative 'airport'

class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def current_airport
		@current_airport
	end

	def land airport
		fail 'Not an airport' unless airport.is_a?(Airport)
		fail "Can't land in stormy weather" if airport.is_stormy?
		fail "Can't land at a full airport" if airport.is_full?
		@current_airport = airport
		@flying = false
	end

	def take_off
		fail "Can't take off while already flying" if @flying
		fail "Can't take off in stormy weather" if @current_airport.is_stormy?
		@flying = true
		@current_airport = nil
	end

end


