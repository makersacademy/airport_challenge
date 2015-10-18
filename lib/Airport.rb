require_relative 'Plane'
require_relative 'Weather'

class Airport

	attr_reader :planes, :capacity, :weather

	DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
		@planes = []
		@capacity = DEFAULT_CAPACITY
		@weather = weather
	end

	def land(plane)
		raise "Can not land, airport is full!" if full?
		raise "Can not land, weather is too bad." if stormy?
		planes << plane
	end

	def take_off
		raise "Can not take off, weather is too bad." if stormy?
		planes.pop
	end

	def full?
		planes.length >= capacity
	end

	def stormy?
		weather > 0.8
	end

end
