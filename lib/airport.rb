require_relative 'weather'
require_relative 'plane'

class Airport

	def initialize		
		@landed = []
	end

	def land(plane)
		fail "Airport full" if @landed.count >= 20
		@landed << plane
		"Welcome to London"
	end

	def take_off(plane)
		@landed.pop
		"Have a pleasant flight"
	end

	def in_airport?(plane)
		@landed.include? plane
	end

	attr_reader :plane

end