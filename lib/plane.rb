require_relative 'airport'
class Plane
	attr_accessor :landed

	def initialize
		@landed = true
	end

	def land(airport)
		@landed = true
		airport.landed_planes << self
	end

	def take_off(airport)
		@landed = false
		airport.landed_planes.delete(self)
	end

	def landed?
		@landed
	end

end