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
		raise "Can not land, weather is too bad." if @weather.stormy?
		raise "Can not land, plane has already landed!" if plane.landed == true
		@planes << plane
		plane.land
	end

	def take_off(plane)
		raise "Can not take off, weather is too bad." if @weather.stormy?
		raise "Can not take off, plane is not at this airport." unless @planes.include?(plane)
		plane.flying
		@planes.pop

	end

private

	def full?
		@planes.length >= @capacity
	end


end
