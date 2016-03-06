require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

#require_relative 'container'

attr_reader :capacity, :storage

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@storage = []
	end

	def full?
		storage.length>=capacity 
	end

	def in_airport?(plane)
		storage.include?(plane)
	end

	def airport_open?(weather)
		climate = weather.random_weather
	 	climate == "Sunny"
	end

end

