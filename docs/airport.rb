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
	 	climate == "not stormy"
	end

end

	def list_all(class_instances)
		ObjectSpace.each_object(class_instances).to_a
	end

	airports = list_all(Airport)

	def find_plane(plane)
		airports.select do | airport |
			airport.in_airport?(plane)
		end
	end