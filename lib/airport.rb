require_relative 'weather'
require_relative 'plane'

class Airport

	def initialize(weather=Weather.new)
		@landed = []
		@weather = weather
	end

	def land(plane)
		fail "Unable to land in a storm" if weather.stormy?
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

	attr_reader :weather
	attr_reader :plane

end