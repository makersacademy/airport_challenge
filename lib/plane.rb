require_relative 'airport'

class Plane
	attr_reader :flying, :current_airport
	def initialize
		@flying = true
		@current_airport = nil
	end

	def land airport
		fail 'Not an airport' unless airport.is_a?(Airport)
		airport.land_permission
		@flying = false
		@current_airport = airport
		airport.plane_landed(self)
	end

	def take_off
		fail "Already flying" if @flying
		@current_airport.take_off_permission
		@current_airport.plane_taken_off(self)
		@flying = true
		@current_airport = nil
		return self
	end
end
