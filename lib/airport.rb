require_relative 'plane'
require_relative 'weatherconditions'

class Airport

CAPACITY = 5

	include WeatherConditions

	def initialize(capacity=CAPACITY)
		@planes = []
		@current_weather = WEATHER.sample
		@capacity = capacity
	end

	def land plane
		fail "Bad weather! Too dangerous to land plane." if self.current_weather == :stormy
		fail "Cannot land. Airport is full!" if full?
		if !plane.landed?
			plane.land
			@planes << plane 
		else
			return "Already landed at this airport" if @planes.include?(plane)
			"This plane has already landed elsewhere"
		end
	end

	def take_off plane
		fail "Bad weather! Too dangerous to take off." if self.current_weather == :stormy
		if plane.landed? && @planes.include?(plane)
			plane.take_off
			@planes.delete(plane) 
		else
		 	"This plane is not at this airport!"
		end
	end

	def planes
		 @planes.dup
	end

	def capacity
		capacity = @capacity
	end

	def current_weather
		current_weather = @current_weather
	end

	private

	def full?
		@planes.length == @capacity
	end

end