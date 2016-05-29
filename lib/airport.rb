require_relative 'weather'
require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 20

	def initialize(weather: Weather.new)		
		@landed = []
		@weather = weather
	end

	def land(plane)
		fail "Cannot land in a storm" if weather.stormy?
		fail "Airport full" if @landed.count >= DEFAULT_CAPACITY
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

	private

	attr_reader :plane

end