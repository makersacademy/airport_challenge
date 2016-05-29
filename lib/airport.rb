require_relative 'weather'
require_relative 'plane'

class Airport

	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)		
		@landed = []
		@capacity = capacity
		@weather = weather
	end

	def land(plane)
		#fail "Cannot land in a storm" if weather.stormy?
		fail "Airport full" if full?
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

	def full?
		@landed.count >= @capacity
	end

	attr_reader :plane

end