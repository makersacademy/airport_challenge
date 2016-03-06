require_relative 'plane'
require_relative 'weatherconditions'

class Airport

CAPACITY = 5

	include WeatherConditions

	attr_reader :planes, :current_weather, :capacity

	def initialize(capacity=CAPACITY)
		@planes = []
		@current_weather = WEATHER.sample
		@capacity = capacity
	end

	def land plane
		fail ("Bad weather! Too dangerous to land plane.") if self.current_weather == :stormy
		fail ("Cannot land. Airport is full!") if @planes.size == CAPACITY
		unless plane.landed?
			plane.change_landed_status
			@planes << plane 
		else
			"This plane has already landed elsewhere"
		end
	end

	def take_off plane
		fail ("Bad weather! Too dangerous to take off.") if self.current_weather == :stormy
		if plane.landed? && @planes.include?(plane)
		plane.change_landed_status
		@planes.delete(plane) 
	else
		 "This plane is not at this airport!"
		end
	end

	private

	def full?
		@planes.length == @capacity
	end

	def empty?
		@planes.length == 0
	end

end