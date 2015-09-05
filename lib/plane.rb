require_relative 'airport'

class Plane
	attr_reader :flying, :current_airport
	def initialize
		@flying = true
		@current_airport = nil
	end

	def land airport
		fail 'Not an airport' unless airport.is_a?(Airport)
	end
end
