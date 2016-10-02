require_relative 'airport'
require_relative 'weather'

class Plane
	attr_accessor :landed

	def initialize
		@landed = true
	end

	def land(airport, weather)
		raise 'Too stormy to land!' if weather.stormy?
		raise 'Airport is full!' if airport.full?
		@landed = true
		airport.landed_planes << self
	end

	def take_off(airport, weather)
		raise 'Too stormy to take off!' if weather.stormy?
		@landed = false
		airport.landed_planes.delete(self)
	end

	def landed?
		@landed
	end

end